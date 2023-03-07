package main

import (
	"fmt"

	"github.com/go-daq/canbus"
)

// var api = new(serv.CanServ)

// func main() {
// 	r := gin.Default()
// 	r.GET("ws", func(ctx *gin.Context) {
// 		api.OpenServ(ctx)
// 	})
// 	r.Run(":8080")
// }

func main() {

	// Sendsck, _ := canbus.New()

	// Sendsck.Bind("can0")
	// frame := canbus.Frame{
	// 	ID:   0x78,
	// 	Data: []byte("123456"),
	// 	Kind: canbus.SFF,
	// }
	// go func() {
	// 	for {
	// 		Sendsck.Send(frame)
	// 		time.Sleep(1 * time.Second)
	// 	}
	// }()
	Readsck, _ := canbus.New()
	Readsck.Bind("can1")
	for {
		msg, _ := Readsck.Recv()
		fmt.Println("recv: ", msg)
	}
}
