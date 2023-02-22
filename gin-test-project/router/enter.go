package router

import (
	"test/gin-test-project/router/beep"
	"test/gin-test-project/router/lora"
	"test/gin-test-project/router/system"

	"github.com/gin-gonic/gin"
)

type Routergroup struct {
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
}
