package router

import (
	"gin-test-project/router/beep"
	"gin-test-project/router/lora"
	"gin-test-project/router/serial"
	"gin-test-project/router/system"

	"github.com/gin-gonic/gin"
)

type Routergroup struct {
	serial.SerialRouter
	beep.BeepRouter
	lora.DbRouter
	system.ConfigRouter
	system.SqlRouter
}

var RouterEnter = new(Routergroup)

func InitRouter(r *gin.Engine) {
	RouterEnter.DbRouter.DbRouterInit(r)
	RouterEnter.ConfigRouter.ConfigRouterInit(r)
	RouterEnter.SqlRouter.SqlRouterInit(r)
	RouterEnter.BeepRouter.BeepRouterInit(r)
	RouterEnter.SerialRouter.SerialRouterInit(r)
}
