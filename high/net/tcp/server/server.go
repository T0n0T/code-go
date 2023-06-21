package main

import (
	"log"
	"net"
)

func main() {
	TCPUP()
	<-make(chan struct{})
}

func TCPUP() {
	// 启动服务器
	listener, err := net.Listen("tcp", "192.168.1.4:1234")
	if err != nil {
		log.Println("Failed to start server:", err)
		return
	}

	// 循环接受客户端连接
	conn, err := listener.Accept()
	if err != nil {
		log.Println("Failed to accept connection:", err)
		return
	}

	go handleConnection(conn) // 启动一个 goroutine 处理连接
}

// 处理连接
func handleConnection(conn net.Conn) {
	defer conn.Close()

	// 读取客户端发送的数据
	buffer := make([]byte, 1024)
	n, err := conn.Read(buffer)
	if err != nil {
		log.Println("Failed to read data:", err)
		return
	}

	// 回传收到的数据给客户端
	_, err = conn.Write(buffer[:n])
	if err != nil {
		log.Println("Failed to write data:", err)
		return
	}
}
