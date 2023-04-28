package v1

import (
	"gin-test-project/api/v1/beep"
	"gin-test-project/api/v1/lora"
	"gin-test-project/api/v1/serial"
	"gin-test-project/api/v1/system"
	"gin-test-project/api/v1/udp"
	"gin-test-project/api/v1/websocket"
)

type Apigroup struct {
	system.ConfigApi
	system.SqlApi
	lora.DbloraApi
	beep.BeepApi
	serial.SerialApi
	websocket.WebsocketService
	udp.UDPService
}

var ApiEnter = new(Apigroup)
