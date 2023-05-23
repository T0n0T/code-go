package main

import (
	"encoding/json"
	"fmt"
	"net"
	"net-test/udp/model"
	"time"
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
			dataLen := uint16(len(sendData))
			d := []byte{0xab, 0xcd, 0x02, 0x01, byte(dataLen >> 8), byte(dataLen & 0xff)}
			d = append(d, sendData...)
			_, err = socket.Write(d) // 发送数据
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
