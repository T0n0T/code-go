package main

import (
	"fmt"
	"log"
	"time"

	"github.com/tarm/serial"
)

// func main() {
// 	Dev_mode := serial.Mode{BaudRate: 115200, StopBits: 1}
// 	tty, err := serial.Open("/dev/ttyCH9344USB3", &Dev_mode)
// 	if err != nil {
// 		fmt.Println(err.Error())
// 	}
// 	go func() {
// 		for {
// 			n, err := tty.Write([]byte("jianggoujianggoujianggou\n\rsssss11111\n\r"))
// 			if err != nil {
// 				log.Fatal(err)
// 			}
// 			fmt.Printf("Sent %v bytes\n", n)
// 		}

// 	}()

// 	buff := make([]byte, 100)
// 	for {
// 		n, err := tty.Read(buff)
// 		if err != nil {
// 			log.Fatal(err)
// 			break
// 		}
// 		if n == 0 {
// 			fmt.Println("\nEOF")
// 			break
// 		}
// 		fmt.Printf("%v", string(buff[:n]))
// 	}

// }

func main() {
	mode := serial.Config{
		Name:     "COM7",
		Baud:     115200,
		StopBits: 1,
	}
	tty, err := serial.OpenPort(&mode)
	if err != nil {
		fmt.Println(err.Error())
	}
	go func() {
		for {
			_, err := tty.Write([]byte("test\n\rtest\n\r"))
			if err != nil {
				log.Fatal(err)
			}
			// fmt.Printf("Sent %v bytes\n", n)
			time.Sleep(1 * time.Second)
			tty.Write([]byte(""))
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
			// fmt.Println("\nEOF")
			break
		}
		fmt.Printf("%v", string(buff[:n]))
	}

}
