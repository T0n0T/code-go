package main

import (
	"fmt"
	"log"

	"go.bug.st/serial"
)

func main() {
	Dev_mode := serial.Mode{BaudRate: 115200}
	tty, _ := serial.Open("/dev/ttyUSB0", &Dev_mode)

	go func() {
		for {
			n, err := tty.Write([]byte("jianggoujianggoujianggou\n\rsssss11111\n\r"))
			if err != nil {
				log.Fatal(err)
			}
			fmt.Printf("Sent %v bytes\n", n)
		}

	}()

	buff := make([]byte, 100)
	for {
		n, err := tty.Read(buff)
		if err != nil {
			log.Fatal(err)
			break
		}
		if n == 0 {
			fmt.Println("\nEOF")
			break
		}
		fmt.Printf("%v", string(buff[:n]))
	}

}
