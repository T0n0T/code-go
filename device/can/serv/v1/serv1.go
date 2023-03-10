package serv

import (
	"errors"
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/go-daq/canbus"
	"github.com/olahol/melody"
	"golang.org/x/sys/unix"
)

type CanServ struct {
	Melody    *melody.Melody
	Can_dev   string
	Sck       *canbus.Socket
	SendFrame *canbus.Frame
	filter    []unix.CanFilter
	Sign      chan string
}

var FrameDefault = canbus.Frame{ID: 0x00, Kind: canbus.SFF}

func (c *CanServ) canRecv(ss *melody.Session) {
Loop:
	for {
		select {
		case <-c.Sign:
			if <-c.Sign == "close" {
				break Loop
			}
		default:
			msg, _ := c.Sck.Recv() //socket接收报文,若接收不到则会阻塞,阻塞后上面的case无法接收到关闭信号
			ss.Write(msg.Data)
		}
	}
}

func (c *CanServ) canSend(ss *melody.Session, msg []byte) {
	c.SendFrame.Data = msg
	c.Sck.Send(*c.SendFrame)
	fmt.Println(c.SendFrame)
}

func (c *CanServ) opencan(ss *melody.Session) {
	ss.Write([]byte(c.Can_dev + " open...\n"))
	go c.canRecv(ss)
}

func (c *CanServ) closecan(ss *melody.Session) {
	c.Sck.Close()
	c.Sign <- "close"
	// defer c.Sck.Close()
}

func (c *CanServ) OpenServ( /*Dev_name string, */ ctx *gin.Context) (err error) {
	c.Melody = melody.New()
	if c.SendFrame == nil {
		c.SendFrame = &FrameDefault
	}
	c.Sck, err = canbus.New()
	if err != nil {
		err = errors.New(c.Can_dev + "创建失败")
	}
	fmt.Println(c.Can_dev)
	c.Sck.Bind("can0")
	if c.filter != nil {
		c.Sck.SetFilters(c.filter)
	}
	c.Melody.HandleMessage(c.canSend)
	c.Melody.HandleConnect(c.opencan)
	c.Melody.HandleDisconnect(c.closecan)
	c.Melody.HandleRequest(ctx.Writer, ctx.Request)
	return
}

func NewServ(name string, Frame *canbus.Frame, filter []unix.CanFilter) (c *CanServ) {
	c = new(CanServ)
	c.Can_dev = name
	c.SendFrame = Frame
	c.filter = filter
	c.Sign = make(chan string)
	return
}
