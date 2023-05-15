package main

import (
	"fmt"
	"net"
	"net-test/udp/model"
	"time"

	"github.com/goccy/go-json"
)

// UDP 客户端
func main() {
	socket, err := net.DialUDP("udp", nil, &net.UDPAddr{
		IP:   net.IPv4(0, 0, 0, 0),
		Port: 30000,
	})
	listen, err := net.ListenUDP("udp", &net.UDPAddr{
		IP:   net.IPv4(0, 0, 0, 0),
		Port: 30001,
	})
	if err != nil {
		fmt.Println("连接UDP服务器失败，err: ", err)
		return
	}
	defer socket.Close()

	data := make([]byte, 4096)
	go func() {
		for {
			msg := model.LedUDP{ID: 12, Status: true}
			a, _ := json.Marshal(msg)
			sendData := []byte(a)
			_, err = socket.Write(sendData) // 发送数据
			if err != nil {
				fmt.Println("发送数据失败，err: ", err)
				return
			}
			time.Sleep(500 * time.Millisecond)
		}

	}()

	for {
		n, remoteAddr, err := listen.ReadFromUDP(data) // 接收数据
		if err != nil {
			fmt.Println("接收数据失败, err: ", err)
			return
		}
		fmt.Printf("recv:%v addr:%v count:%v\n", string(data[:n]), remoteAddr, n)
	}

}
