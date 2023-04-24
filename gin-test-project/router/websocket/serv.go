package websocket

import (
	v1 "gin-test-project/api/v1"

	"github.com/gin-gonic/gin"
)

type WebsocketRouter struct {
}

func (*WebsocketRouter) WebsocketServRouterInit(router *gin.Engine) {
	dbr := router.Group("websocket")
	routerapi := v1.ApiEnter.WebsocketService
	routerapi.InitFunc()
	{
		dbr.GET("/test", routerapi.TestServ)
	}
}
