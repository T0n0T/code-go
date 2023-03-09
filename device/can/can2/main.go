package main

import (
	"fmt"
	"time"

	"github.com/brutella/can"
)

// func main() {

// 	// Sendsck, _ := canbus.New()

// 	// Sendsck.Bind("can1")
// 	// frame := canbus.Frame{
// 	// 	ID:   0x78,
// 	// 	Data: []byte("123456"),
// 	// 	Kind: canbus.SFF,
// 	// }
// 	// for {
// 	// 	Sendsck.Send(frame)
// 	// 	time.Sleep(1 * time.Second)
// 	// }
// 	Readsck, _ := canbus.New()
// 	Readsck.Bind("can0")
// 	for {
// 		msg, _ := Readsck.Recv()
// 		fmt.Println("recv: ", msg)
// 	}
// }

func handleCANFrame(frm can.Frame) {
	fmt.Println(frm.Data)
}

func main() {

	// Sendsck, _ := canbus.New()

	// Sendsck.Bind("can1")
	// frame := canbus.Frame{
	// 	ID:   0x78,
	// 	Data: []byte("123456"),
	// 	Kind: canbus.SFF,
	// }
	// for {
	// 	Sendsck.Send(frame)
	// 	time.Sleep(1 * time.Second)
	// }
	fmt.Println("开始")
	bus, _ := can.NewBusForInterfaceWithName("can0")

	fmt.Println("11111")
	frm := can.Frame{
		ID:     0x701,
		Length: 1,
		Flags:  0,
		Res0:   0,
		Res1:   0,
		Data:   [8]uint8{0x05},
	}

	bus.SubscribeFunc(handleCANFrame)
	go bus.ConnectAndPublish()
	for {
		fmt.Println("在for循环")
		bus.Publish(frm)
		time.Sleep(1 * time.Second)
	}

}
