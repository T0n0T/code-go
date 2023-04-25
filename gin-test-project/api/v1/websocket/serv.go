package websocket

import (
	"errors"

	"github.com/gin-gonic/gin"
	"github.com/olahol/melody"
)

type WebsocketServ struct{}

var (
	WEBSERV *melody.Melody
)

type Mission struct {
	session       *melody.Session
	MissionName   string
	MissionHandle Handle
}

type Handle interface {
	Send(*melody.Session)
	Recv([]byte)
}

func getMission(ss *melody.Session) (m *Mission, err error) {
	v, exists := ss.Get("mission")
	if !exists {
		err = errors.New("mission has not been set")
		return
	}
	m = v.(*Mission)
	return
}

func WebsocketSend(ss *melody.Session) {
	m, err := getMission(ss)
	if err != nil {
		return
	}
Loop:
	for {
		select {
		case <-ss.Request.Context().Done():
			break Loop
		default:
			m.MissionHandle.Send(ss)
		}
	}
}

func WebsocketRecv(ss *melody.Session, msg []byte) {
	m, err := getMission(ss)
	if err != nil {
		return
	}
	m.MissionHandle.Recv(msg)
}

func openWebsocketServ(ss *melody.Session) {
	m, err := getMission(ss)
	if err != nil {
		return
	}
	m.session = ss
	go WebsocketSend(ss)
}

func DeleteFromSlice(slice []*Mission, elem *Mission) []*Mission {
	for i, e := range slice {
		if e == elem {
			slice = append(slice[:i], slice[i+1:]...)
			break
		}
	}
	return slice
}

func closeWebsocketServ(ss *melody.Session) {
}

func openServ() {
	WEBSERV.HandleMessage(WebsocketRecv)
	WEBSERV.HandleConnect(openWebsocketServ)
	WEBSERV.HandleDisconnect(closeWebsocketServ)
}

func RegisterWebsocketServ(ctx *gin.Context) {
	WEBSERV.HandleRequestWithKeys(ctx.Writer, ctx.Request, ctx.Keys)
}
