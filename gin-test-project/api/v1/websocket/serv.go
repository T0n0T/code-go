package websocket

import (
	"github.com/gin-gonic/gin"
	"github.com/olahol/melody"
)

type WebsocketServ struct{}

var (
	WEBSERV  *melody.Melody
	missions []*Mission
	Sign     chan struct{}
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

func WebsocketSend() {
Loop:
	for {
		select {
		case <-Sign:
			break Loop
		default:
			for _, mission := range missions {
				if mission.session != nil {
					mission.MissionHandle.Send(mission.session)
				}
			}
		}
	}
}

func WebsocketRecv(ss *melody.Session, msg []byte) {
	v, exists := ss.Get("mission")
	if !exists {
		return
	}
	m := v.(*Mission)
	m.MissionHandle.Recv(msg)
}

func openWebsocketServ(ss *melody.Session) {
	v, exists := ss.Get("mission")
	if !exists {
		return
	}

	m := v.(*Mission)
	m.session = ss
}

func deleteFromSlice(slice []*Mission, elem *Mission) []*Mission {
	for i, e := range slice {
		if e == elem {
			slice = append(slice[:i], slice[i+1:]...)
			break
		}
	}
	return slice
}

func closeWebsocketServ(ss *melody.Session) {
	v, exists := ss.Get("mission")
	if !exists {
		return
	}
	m := v.(*Mission)
	missions = deleteFromSlice(missions, m)
}

func openServ() {
	WEBSERV.HandleMessage(WebsocketRecv)
	WEBSERV.HandleConnect(openWebsocketServ)
	WEBSERV.HandleDisconnect(closeWebsocketServ)
	go WebsocketSend()
}

func RegisterWebsocketServ(ctx *gin.Context) {
	v, exists := ctx.Get("mission")
	if !exists {
		return
	}
	m := v.(*Mission)
	missions = append(missions, m)

	WEBSERV.HandleRequestWithKeys(ctx.Writer, ctx.Request, ctx.Keys)
}

func NewServ(name string) (w *WebsocketServ, err error) {
	Sign = make(chan struct{})
	return
}
