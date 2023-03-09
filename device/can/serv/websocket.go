package serv

import (
	"errors"
	"fmt"
	"time"

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
			fmt.Println("等待退出")
			time.Sleep(500 * time.Millisecond)
			msg, _ := c.Sck.Recv()
			ss.Write(msg.Data)
			fmt.Printf("addr: %p ", c.Sck)
		}
	}
	ss.Write([]byte(c.Can_dev + "close\n"))
}

func (c *CanServ) canSend(ss *melody.Session, msg []byte) {
	c.SendFrame.Data = msg
	c.Sck.Send(*c.SendFrame)
	fmt.Printf("addr: %p ", c.Sck)
	fmt.Println(c.SendFrame)
}

func (c *CanServ) opencan(ss *melody.Session) {
	ss.Write([]byte(c.Can_dev + " open...\n"))
	go c.canRecv(ss)
}

func (c *CanServ) closecan(ss *melody.Session) {
	c.Sign <- "close"
	defer c.Sck.Close()
}

func (c *CanServ) OpenServ(Dev_name string, ctx *gin.Context) (err error) {
	c.Melody = melody.New()
	if c.SendFrame == nil {
		c.SendFrame = &FrameDefault
	}
	c.Sck, err = canbus.New()
	if err != nil {
		err = errors.New(Dev_name + "创建失败")
	}
	c.Sck.Bind(Dev_name)
	c.Melody.HandleMessage(c.canSend)
	c.Melody.HandleConnect(c.opencan)
	c.Melody.HandleDisconnect(c.closecan)
	c.Melody.HandleRequest(ctx.Writer, ctx.Request)
	return
}

func (c *CanServ) CanSetFrame(Frame canbus.Frame) {
	c.SendFrame = &Frame
}

func (c *CanServ) CanSetFilter(Id uint32, Mask uint32) {
	c.Sck.SetFilters([]unix.CanFilter{
		// {Id: 0x123, Mask: unix.CAN_SFF_MASK},
		{Id: Id, Mask: Mask},
	})
}
