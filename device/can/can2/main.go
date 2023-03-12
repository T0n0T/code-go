package main

import (
	"context"
	"fmt"
	"log"
	"time"

	"github.com/fsnotify/fsnotify"
	"go.einride.tech/can"
	"go.einride.tech/can/pkg/socketcan"
)

func main() {
	// Error handling omitted to keep example simple
	parent := context.Background()
	ctx, cancel := context.WithTimeout(parent, 10*time.Second)
	defer cancel()

	watcher, err := fsnotify.NewWatcher()
	if err != nil {
		log.Fatal(err)
	}
	defer watcher.Close()
	// conn, _ := socketcan.DialContext(parent, "can", "can0")
	conn, _ := socketcan.Dial("can", "can0")
	send := socketcan.NewTransmitter(conn)

	recv := socketcan.NewReceiver(conn)
	var frame can.Frame
	f := can.Frame{ID: 0x78, Length: 8, Data: can.Data{0x11, 0x22, 0x33}} //hex
	go func() {
		for {
			select {
			case <-ctx.Done():
				fmt.Println("退出循环...")
				return
			case event, ok := <-watcher.Events:
				if !ok {
					return
				}
				log.Println("event:", event)
				frame = recv.Frame()
				if event.Has(fsnotify.Write) {
					log.Println("recv:", frame.Data)
					log.Println("modified file:", event.Name)
				}
			default:
				err := send.TransmitFrame(ctx, f)
				if err != nil {
					fmt.Println(err)
				}
				time.Sleep(1 * time.Second)
			}
		}
	}()

	watcher.Add("/tmp")
	// for recv.Receive() {
	// 	frame := recv.Frame()
	// 	fmt.Println(frame.Data)
	// }

	<-make(chan struct{})
}

// func main() {

// 	dev, _ := candevice.New("can1")
// 	dev.SetDown()
// 	fmt.Println(dev.Bitrate())
// 	dev.SetBitrate(250000)
// 	fmt.Println(dev.Bitrate())
// 	dev.SetUp()

// 	Sendsck, _ := canbus.New()
// 	Sendsck.Bind("can1")
// 	frame := canbus.Frame{
// 		ID:   0x79,
// 		Data: []byte("123456"),
// 		Kind: canbus.SFF,
// 	}
// 	for {
// 		Sendsck.Send(frame)
// 		time.Sleep(1 * time.Second)
// 	}
// 	// Readsck, _ := canbus.New()
// 	// Readsck.Bind("can0")
// 	// for {
// 	// 	msg, _ := Readsck.Recv()
// 	// 	fmt.Println("recv: ", msg)
// 	// }
// }

// func handleCANFrame(frm can.Frame) {
// 	fmt.Println(frm.Data)
// }

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
