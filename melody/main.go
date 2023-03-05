package main

import (
	"fmt"
	"log"

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

	Dev_mode := serial.Mode{BaudRate: 115200}
	tty, _ := serial.Open("/dev/ttyUSB0", &Dev_mode)

	r.GET("", func(ctx *gin.Context) {
		ctx.String(200, "hello")
	})

	r.GET("/ws", func(c *gin.Context) {
		fmt.Println("一个新的连接")
		m := melody.New()
		defer m.Close()

		go func(sign chan string) {
			var status string
			// var tmpstr string
			buff := make([]byte, 100)
		Loop:
			for {
				select {
				case status = <-sign:
					if status == "close" {
						fmt.Println("goroutine close")
						break Loop
					}
				default:
					for {
						n, err := tty.Read(buff)
						if err != nil {
							log.Fatal(err)
							break
						}
						if n == 0 {
							m.Broadcast([]byte("\r\nEOF"))
							break
						}
						m.Broadcast(buff[:n])
					}
					// tmpstr = ""
					// for {
					// 	num, _ := tty.Read(buff)
					// 	if num > 0 {
					// 		tmpstr += string(buff[:num])
					// 	} else if num == 0 {
					// 		break
					// 	}
					// 	//查找读到信息的结尾标志
					// 	if strings.Index(tmpstr, "\n") > 0 {
					// 		break
					// 	}
					// }
					// m.Broadcast([]byte(tmpstr))
				}
			}
		}(sign)

		m.HandleMessage(func(s *melody.Session, b []byte) {
			fmt.Println(string(b))
			tty.Write(b)
		})
		m.HandleDisconnect(func(s *melody.Session) {
			tty.Close()
			sign <- "close"
		})
		m.HandleRequest(c.Writer, c.Request)
	})

	r.Run(":8080")

}
