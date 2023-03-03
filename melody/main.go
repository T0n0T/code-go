package main

import (
	"log"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/olahol/melody"
)

func main() {
	r := gin.Default()

	// cfg := &serial.Config{Name: "/dev/tty0", Baud: 115200, ReadTimeout: 3 /*毫秒*/}
	// utils.OpenSerial(cfg)
	m := melody.New()
	r.GET("/ws", func(c *gin.Context) {
		m.HandleRequest(c.Writer, c.Request)
	})

	go func() {
		for {
			m.Broadcast([]byte("1234"))
			s, err := m.Sessions()
			log.Println(s)
			if err != nil {
				err = s[0].Write([]byte("123465"))
				if err != nil {
					log.Println(err)
				}
			}
			time.Sleep(1 * time.Second)
		}
	}()

	r.Run(":8080")
}
