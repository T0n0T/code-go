package service

import (
	"gin-test-project/service/lora"
	"gin-test-project/service/serial"
)

type Servicegroup struct {
	lora.LoraService
	serial.SerialService
}

var ServiceEnter = new(Servicegroup)
