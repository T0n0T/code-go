package main

import (
	"fmt"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/goccy/go-json"
	"github.com/olahol/melody"
)

func main() {
	r := gin.Default()
	sign := make(chan string)

	type jsontest struct {
		Age  int    `json:"age"`
		Name string `json:"name"`
	}
	jj := jsontest{Age: 22, Name: "熙然"}
	// b, _ := utils.StructToBin(jj)
	b, _ := json.Marshal(jj)

	// Dev_mode := serial.Mode{BaudRate: 115200}
	// tty, _ := serial.Open("/dev/ttyUSB0", &Dev_mode)

	r.GET("", func(ctx *gin.Context) {
		ctx.String(200, "hello")
	})

	r.GET("/ws", func(c *gin.Context) {
		m := melody.New()
		defer m.Close()
		go func(sign chan string) {
			var status string
		Loop:
			for {
				select {
				case status = <-sign:
					if status == "close" {
						fmt.Println("goroutine close")
						break Loop
					}
				default:

					m.Broadcast(b)
					// m.Broadcast([]byte("1111111111111"))
					time.Sleep(1 * time.Second)
				}
			}
		}(sign)

		m.HandleDisconnect(func(s *melody.Session) {
			s.Write([]byte("ddddddddddddddddddddd"))
			sign <- "close"
		})
		m.HandleRequest(c.Writer, c.Request)
	})

	r.Run(":8080")

}
