package udp

import (
	"fmt"
	"net"
	"time"

	"github.com/gin-gonic/gin"
)

type TestApi struct {
}

func TestUDP(addr *net.UDPAddr, data []byte) error {
	fmt.Println(addr)
	fmt.Println(data)
	return nil
}

func (*TestApi) TestServ(c *gin.Context) {
	RegisterUDPServ(&net.UDPAddr{
		IP:   net.ParseIP("0.0.0.0"),
		Port: 30000,
	}, "test", TestUDP, c, c.Abort)

	for {
		time.Sleep(500 * time.Second)
	}
}
