package websocket

import (
	"github.com/olahol/melody"
)

type WebsocketService struct {
	WebsocketServ
	TestApi
}

func (w *WebsocketService) InitFunc() error {
	WEBSERV = melody.New()
	openServ()
	return nil
}
