package main

import (
	"fmt"
	"time"

	"github.com/go-daq/canbus"
)

func main() {
	Readsck, _ := canbus.New()
	Sendsck, _ := canbus.New()
	Readsck.Bind("can1")
	Sendsck.Bind("can0")
	frame := canbus.Frame{
		ID:   0x78,
		Data: []byte("123456"),
		Kind: canbus.SFF,
	}
	go func() {
		for {
			msg, _ := Readsck.Recv()
			fmt.Println("recv: ", msg)
		}

	}()

	for {
		Sendsck.Send(frame)
		time.Sleep(1 * time.Second)
	}
}
