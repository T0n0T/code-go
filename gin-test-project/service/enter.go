package service

import (
	"test/gin-test-project/service/lora"
	"test/gin-test-project/service/serial"
)

type Servicegroup struct {
	lora.LoraService
	serial.SerialService
}

var ServiceEnter = new(Servicegroup)
