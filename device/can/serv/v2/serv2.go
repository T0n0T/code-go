package serv2

import (
	"context"
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/olahol/melody"
	"go.einride.tech/can"
	"go.einride.tech/can/pkg/candevice"
	"go.einride.tech/can/pkg/socketcan"
	"golang.org/x/sys/unix"
)

type CanServ struct {
	Melody    *melody.Melody
	name      string
	dev       *candevice.Device
	tx        *socketcan.Transmitter
	rx        *socketcan.Receiver
	sendFrame *can.Frame
	filter    []unix.CanFilter
	Sign      chan string
}

var FrameDefault = can.Frame{ID: 0x00, Length: 8}

func (c *CanServ) canRecv(ss *melody.Session) {
	conn, _ := socketcan.DialContext(context.Background(), "can", "can0")

	c.rx = socketcan.NewReceiver(conn)
Loop:
	for {
		select {
		case <-c.Sign:
			if <-c.Sign == "close" {
				break Loop
			}
		default:
			if c.rx.Receive() {
				frame := c.rx.Frame()
				ss.Write(frame.Data[:])
			}
		}
	}
}

func (c *CanServ) canSend(ss *melody.Session, msg []byte) {
	copy(c.sendFrame.Data[:], msg)
	c.tx.TransmitFrame(context.Background(), *c.sendFrame)
	fmt.Println(c.sendFrame)
}

func (c *CanServ) opencan(ss *melody.Session) {
	ss.Write([]byte(c.name + " open...\n"))
	go c.canRecv(ss)
}

func (c *CanServ) closecan(ss *melody.Session) {
	// defer c.dev.SetDown()
	c.Sign <- "close"
}

func (c *CanServ) OpenServ( /*Dev_name string, */ ctx *gin.Context) (err error) {
	c.Melody = melody.New()
	if c.sendFrame == nil {
		c.sendFrame = &FrameDefault
	}
	// c.dev, _ = candevice.New(c.name)
	// c.dev.SetBitrate(250000)
	// c.dev.SetUp()
	conn, _ := socketcan.DialContext(ctx.Request.Context(), "can", c.name)
	c.tx = socketcan.NewTransmitter(conn)
	// c.rx = socketcan.NewReceiver(conn)

	c.Melody.HandleMessage(c.canSend)
	c.Melody.HandleConnect(c.opencan)
	c.Melody.HandleDisconnect(c.closecan)
	c.Melody.HandleRequest(ctx.Writer, ctx.Request)
	return
}

func NewServ(name string, Frame *can.Frame, filter []unix.CanFilter) (c *CanServ) {
	c = new(CanServ)
	c.name = name
	c.sendFrame = Frame
	c.filter = filter
	c.Sign = make(chan string)
	return
}
