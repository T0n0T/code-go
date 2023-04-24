package websocket

import (
	"gin-test-project/utils"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/olahol/melody"
)

type WebsocketServ struct {
}

func (*WebsocketServ) TestServ(c *gin.Context) {
	type mission struct {
		Name string
		Age  int
	}
	a := mission{"sa", 12}
	c.Set("mission", a)
	c.Redirect(http.StatusTemporaryRedirect, "/websocket")
}

func (*WebsocketServ) Serv(c *gin.Context) {
	mission, _ := c.Get("mission")
	d, _ := utils.StructToBin(&mission)
	m := melody.New()
	m.HandleMessage(func(s *melody.Session, b []byte) {
		m.Broadcast(b)
		m.Broadcast(d)
	})
	m.HandleRequest(c.Writer, c.Request)
}
