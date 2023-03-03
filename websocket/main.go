package main

import (
	"log"
	"net/http"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
	serial "github.com/tarm/goserial"
)

var upgrader = websocket.Upgrader{
	// 这个是校验请求来源
	// 在这里我们不做校验，直接return true
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

func main() {
	engine := gin.Default()

	c := &serial.Config{Name: "/dev/ttyCH9344USB1", Baud: 115200}
	s, err := serial.OpenPort(c)
	if err != nil {
		log.Fatal(err)
	}

	buf := make([]byte, 128)

	serialstring := make(chan string)

	engine.GET("/ws", func(c *gin.Context) {
		// 将普通的http GET请求升级为websocket请求
		client, _ := upgrader.Upgrade(c.Writer, c.Request, nil)
		go func(ch chan string) {

			for {
				var tmpstr string = ""
				for i := 0; i < 3000; i++ {

					num, _ := s.Read(buf)
					if num > 0 {
						tmpstr += string(buf[:num])
					}

					//查找读到信息的结尾标志
					if strings.Index(tmpstr, "\r\n") > 0 {
						break
					}
				}

				client.WriteMessage(websocket.TextMessage, []byte(tmpstr))
				_, a, _ := client.ReadMessage()
				s.Write(a)

				time.Sleep(1 * time.Second)
			}

		}(serialstring)
	})

	engine.Run(":8080")
	if err != nil {
		log.Fatalln(err)
	}
}
