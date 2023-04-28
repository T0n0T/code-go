package udp

import (
	v1 "gin-test-project/api/v1"

	"github.com/gin-gonic/gin"
)

type UDPRouter struct {
}

func (*UDPRouter) UDPRouterInit(router *gin.Engine) {
	dbr := router.Group("udp")
	routerapi := v1.ApiEnter.UDPService
	// routerapi.InitFunc()
	{
		dbr.GET("/test", routerapi.TestServ)
	}
}
