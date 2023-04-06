package main

import (
	"fmt"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/olahol/melody"
	"go.bug.st/serial"
)

// func main() {
// 	r := gin.Default()
// 	sign := make(chan string)

// 	// Dev_mode := serial.Mode{BaudRate: 115200}
// 	// tty, _ := serial.Open("/dev/ttyUSB0", &Dev_mode)

// 	r.GET("", func(ctx *gin.Context) {
// 		ctx.String(200, "hello")
// 	})

// 	r.GET("/ws", func(c *gin.Context) {
// 		m := melody.New()
// 		defer m.Close()
// 		go func(sign chan string) {
// 			var status string
// 		Loop:
// 			for {
// 				select {
// 				case status = <-sign:
// 					if status == "close" {
// 						fmt.Println("goroutine close")
// 						break Loop
// 					}
// 				default:
// 					m.Broadcast([]byte("1111111111111"))
// 					time.Sleep(1 * time.Second)
// 				}
// 			}
// 		}(sign)

// 		m.HandleDisconnect(func(s *melody.Session) {
// 			s.Write([]byte("ddddddddddddddddddddd"))
// 			sign <- "close"
// 		})
// 		m.HandleRequest(c.Writer, c.Request)
// 	})

// 	r.Run(":8080")

// }

func main() {
	r := gin.Default()
	sign := make(chan string)

	Dev_mode := serial.Mode{BaudRate: 115200, DataBits: 8, StopBits: 0}

	r.GET("", func(ctx *gin.Context) {
		ctx.String(200, "hello")
	})

	r.GET("/serial/ws", func(c *gin.Context) {
		fmt.Println("一个新的连接")
		m := melody.New()
		tty, _ := serial.Open("/dev/ttyCH9344USB1", &Dev_mode)

		go func(sign chan string) {
			var status string
			var tmpstr string
			buf := make([]byte, 100)
		Loop:
			for {
				select {
				case status = <-sign:
					if status == "close" {
						fmt.Println("goroutine close")
						break Loop
					}
				default:
					tmpstr = ""
					for {
						num, _ := tty.Read(buf)
						if num > 0 {
							tmpstr += string(buf[:num])
						} else if num == 0 {
							break
						}
						//查找读到信息的结尾标志
						if strings.LastIndex(tmpstr, "\n") > 0 {
							break
						}
					}
					m.Broadcast([]byte(tmpstr))
				}
			}
		}(sign)

		m.HandleMessage(func(s *melody.Session, b []byte) {
			m.Broadcast([]byte(b))
			fmt.Println(string(b))
			tty.Write(b)
		})
		m.HandleDisconnect(func(s *melody.Session) {
			fmt.Println(string("close........."))
			tty.Close()
			fmt.Println(string("close.........2"))
			sign <- "close"
		})
		m.HandleRequest(c.Writer, c.Request)
		// m.Close()
	})

	r.Run(":8888")

}
