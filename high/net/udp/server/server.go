package main

import (
	"fmt"
	"net"
	"net-test/udp/model"

	"github.com/goccy/go-json"
)

type SendPack struct {
	Addr *net.UDPAddr
	Data []byte
}

// UDP Server端
func main() {
	listen, err := net.ListenUDP("udp", &net.UDPAddr{
		IP:   net.IPv4(0, 0, 0, 0),
		Port: 30001,
	})
	if err != nil {
		fmt.Println("Listen failed, err: ", err)
		return
	}
	defer listen.Close()
	var data [1024]byte
	var msg model.UpdateMsg

	// ch := make(chan SendPack, 5)
	// go func() {
	// for {
	// 	// sendpack := <-ch

	// 	msg := model.LedUDP{ID: 12, Status: true}
	// 	a, _ := json.Marshal(msg)
	// 	sendData := []byte(a)

	// 	_, err = listen.WriteToUDP(sendData, &net.UDPAddr{
	// 		IP:   net.IPv4(0, 0, 0, 0),
	// 		Port: 30001,
	// 	}) // 发送数据
	// 	if err != nil {
	// 		fmt.Println("Write to udp failed, err: ", err)
	// 	}
	// }
	// }()
	for {
		n, _, err := listen.ReadFromUDP(data[:]) // 接收数据
		if err != nil {
			fmt.Println("read udp failed, err: ", err)
			continue
		}
		msg = model.UpdateMsg{}
		json.Unmarshal(data[7:n], &msg)

		fmt.Println(msg)
	}
}
