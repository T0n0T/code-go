package websocket

import (
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/olahol/melody"
)

type TestApi struct {
}

type TestHandle struct {
}

func (*TestHandle) Send(ss *melody.Session) {
	err := ss.Write([]byte("ssssssssssss test"))
	if err != nil {
		fmt.Println(err)
	}
}

func (*TestHandle) Recv([]byte) {

}

func (*TestApi) TestServ(c *gin.Context) {
	mission := new(Mission)
	mission.MissionName = "test"
	mission.MissionHandle = &TestHandle{}
	c.Set("mission", mission)
	RegisterWebsocketServ(c)
}
