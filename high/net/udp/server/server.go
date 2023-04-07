package main

import (
	"fmt"
	"net"
	"net-test/udp/model"

	"github.com/goccy/go-json"
)

// UDP Server端
func main() {
	listen, err := net.ListenUDP("udp", &net.UDPAddr{
		IP:   net.IPv4(0, 0, 0, 0),
		Port: 30000,
	})
	if err != nil {
		fmt.Println("Listen failed, err: ", err)
		return
	}
	defer listen.Close()
	for {

		var data [1024]byte
		var msg model.LedMsg
		fmt.Println("111")
		n, addr, err := listen.ReadFromUDP(data[:]) // 接收数据
		fmt.Println("222")
		if err != nil {
			fmt.Println("read udp failed, err: ", err)
			continue
		}
		json.Unmarshal(data[:n], &msg)
		fmt.Println(msg)
		fmt.Printf("data:%v addr:%v count:%v\n", string(data[:n]), addr, n)
		_, err = listen.WriteToUDP(data[:n], addr) // 发送数据
		if err != nil {
			fmt.Println("Write to udp failed, err: ", err)
			continue
		}
	}
}
