package main

import (
	"net/http"
	"time"

	"test/gin-test-project/utils"

	"github.com/gin-gonic/gin"
	"github.com/olahol/melody"
	serial "github.com/tarm/goserial"
)

func main() {
	r := gin.Default()
	m := melody.New()
	cfg := &serial.Config{Name: "COM7", Baud: 115200, ReadTimeout: 3 /*毫秒*/}
	utils.OpenSerial(cfg)

	r.GET("/", func(c *gin.Context) {
		http.ServeFile(c.Writer, c.Request, "index.html")
	})

	r.GET("/ws", func(c *gin.Context) {
		m.HandleRequest(c.Writer, c.Request)
		go func() {
			m.Broadcast([]byte("1234"))
			m.HandleMessage()
			time.Sleep(1 * time.Second)
		}()

	})

	r.Run(":8080")
}
