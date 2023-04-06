package main

import (
	serv "device/can/serv/v2"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	r.GET("/can/ws", func(ctx *gin.Context) {
		api := serv.NewServ("can0", nil, nil)
		api.OpenServ(ctx)
	})

	r.Run(":8888")
}

// func main() {
// 	Sendsck, _ := canbus.New()
// 	Sendsck.Bind("can0")
// 	frame := canbus.Frame{
// 		ID:   0x78,
// 		Data: []byte("hello"),
// 		Kind: canbus.SFF,
// 	}

// 	for {
// 		Sendsck.Send(frame)
// 	}
// }

// func main() {
// 	Readsck, _ := canbus.New()
// 	Sendsck, _ := canbus.New()
// 	Readsck.Bind("can1")
// 	Sendsck.Bind("can0")
// 	frame := canbus.Frame{
// 		ID:   0x78,
// 		Data: []byte("123456"),
// 		Kind: canbus.SFF,
// 	}
// 	go func() {
// 		for {
// 			msg, _ := Readsck.Recv()

// 			fmt.Println("recv: ", msg)
// 		}

// 	}()

// 	for {
// 		Sendsck.Send(frame)
// 		time.Sleep(1 * time.Second)
// 	}
// }
