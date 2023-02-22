package v1

import (
	"test/gin-test-project/api/v1/beep"
	"test/gin-test-project/api/v1/lora"
	"test/gin-test-project/api/v1/system"
)

type Apigroup struct {
	system.ConfigApi
	system.SqlApi
	lora.DbloraApi
	beep.BeepApi
}

var ApiEnter = new(Apigroup)
