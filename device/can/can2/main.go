package main

import (
	"fmt"
	"time"

	"github.com/go-daq/canbus"
	"go.einride.tech/can"
	"go.einride.tech/can/pkg/candevice"
)

// func main() {
// 	// Error handling omitted to keep example simple
// 	dev, _ := candevice.New("can0")
// 	dev.SetDown()
// 	fmt.Println(dev.Bitrate())
// 	dev.SetBitrate(250000)
// 	fmt.Println(dev.Bitrate())
// 	dev.SetUp()
// 	fmt.Println(dev.Bitrate())
// 	// conn, _ := socketcan.DialContext(context.Background(), "can", "can1")

// 	// recv := socketcan.NewReceiver(conn)
// 	// for {
// 	// 	for recv.Receive() {
// 	// 		frame := recv.Frame()
// 	// 		fmt.Println(frame.String())
// 	// 	}
// 	// }
// }

func main() {

	dev, _ := candevice.New("can1")
	dev.SetDown()
	fmt.Println(dev.Bitrate())
	dev.SetBitrate(250000)
	fmt.Println(dev.Bitrate())
	dev.SetUp()

	Sendsck, _ := canbus.New()
	Sendsck.Bind("can1")
	frame := canbus.Frame{
		ID:   0x79,
		Data: []byte("123456"),
		Kind: canbus.SFF,
	}
	for {
		Sendsck.Send(frame)
		time.Sleep(1 * time.Second)
	}
	// Readsck, _ := canbus.New()
	// Readsck.Bind("can0")
	// for {
	// 	msg, _ := Readsck.Recv()
	// 	fmt.Println("recv: ", msg)
	// }
}

func handleCANFrame(frm can.Frame) {
	fmt.Println(frm.Data)
}

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
// 	fmt.Println("开始")
// 	bus, _ := can.NewBusForInterfaceWithName("can0")

// 	fmt.Println("11111")
// 	frm := can.Frame{
// 		ID:     0x701,
// 		Length: 1,
// 		Flags:  0,
// 		Res0:   0,
// 		Res1:   0,
// 		Data:   [8]uint8{0x05},
// 	}

// 	bus.SubscribeFunc(handleCANFrame)
// 	go bus.ConnectAndPublish()
// 	for {
// 		fmt.Println("在for循环")
// 		bus.Publish(frm)
// 		time.Sleep(1 * time.Second)
// 	}

// }
