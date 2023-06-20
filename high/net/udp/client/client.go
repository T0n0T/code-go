package main

import (
	"fmt"
	"net"
	"time"
)

// UDP 客户端
func main() {
	// flag.Arg(1)
	socket, err := net.DialUDP("udp", nil, &net.UDPAddr{
		IP:   net.IPv4(192, 168, 20, 5),
		Port: 30000,
	})
	// listen, err := net.ListenUDP("udp", &net.UDPAddr{
	// 	IP:   net.IPv4(127, 0, 0, 1),
	// 	Port: 30001,
	// })
	if err != nil {
		fmt.Println("连接UDP服务器失败，err: ", err)
		return
	}
	defer socket.Close()

	// go func()
	//  {
	// for {
	// 	msg := model.LedUDP{ID: 2, Status: 1}
	// 	a, _ := json.Marshal(msg)
	// 	sendData := []byte(a)
	// 	dataLen := uint16(len(sendData))
	// 	d := []byte{0xab, 0xcd, 0x02, 0x01, byte(dataLen >> 8), byte(dataLen & 0xff), 0x00}
	// 	d = append(d, sendData...)
	// 	_, err = socket.Write(d) // 发送数据
	// 	if err != nil {
	// 		fmt.Println("发送数据失败，err: ", err)
	// 		// return
	// 	}
	// 	time.Sleep(1000 * time.Millisecond)
	// }

	for {
		sendData := `{
        "4": {
            "status": 1
        }
    }`
		// a, _ := json.Marshal(msg)
		// sendData := []byte(a)
		dataLen := uint16(len(sendData))
		d := []byte{0xab, 0xcd, 0x02, 0x01, byte(dataLen >> 8), byte(dataLen & 0xff), 0x00}
		d = append(d, sendData...)
		_, err = socket.Write(d) // 发送数据
		if err != nil {
			fmt.Println("发送数据失败，err: ", err)
			// return
		}
		time.Sleep(1000 * time.Millisecond)
	}

	// }()

	// data := make([]byte, 4096)
	// for {
	// 	n, remoteAddr, err := listen.ReadFromUDP(data) // 接收数据
	// 	if err != nil {
	// 		fmt.Println("接收数据失败, err: ", err)
	// 		return
	// 	}
	// 	fmt.Printf("recv:%v addr:%v count:%v\n", string(data[:n]), remoteAddr, n)
	// }

}
