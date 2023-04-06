package system

import (
	v1 "gin-test-project/api/v1"

	"github.com/gin-gonic/gin"
)

type ConfigRouter struct {
}

func (*ConfigRouter) ConfigRouterInit(router *gin.Engine) {
	dbr := router.Group("config")
	routerapi := v1.ApiEnter.ConfigApi
	{
		dbr.POST("read", routerapi.ReadConfig)
		dbr.POST("write", routerapi.WriteConfig)
	}
}
