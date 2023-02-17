package service

import "test/gin-test-project/service/lora"

type Servicegroup struct {
	lora.LoraService
}

var ServiceEnter = new(Servicegroup)
