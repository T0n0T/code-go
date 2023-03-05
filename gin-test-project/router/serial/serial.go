package serial

import (
	v1 "test/gin-test-project/api/v1"

	"github.com/gin-gonic/gin"
)

type SerialRouter struct {
}

func (s *SerialRouter) SerialRouterInit(router *gin.Engine) {
	api := v1.ApiEnter.SerialApi
	r := router.Group("serial")
	{
		r.GET("getlist", api.SerialGetList)
		r.POST("set", api.SerialSet)
		r.GET("ws", api.SerialOpen)
	}
}
