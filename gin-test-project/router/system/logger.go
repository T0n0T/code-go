package system

import (
	v1 "gin-test-project/api/v1"

	"github.com/gin-gonic/gin"
)

type LoggerRouter struct {
}

func (*LoggerRouter) LoggerRouterInit(router *gin.Engine) {
	dbr := router.Group("log")
	routerapi := v1.ApiEnter.LoggerApi
	{
		dbr.GET("action", routerapi.GetLog)

	}
}
