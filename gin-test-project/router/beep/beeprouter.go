package beep

import (
	v1 "gin-test-project/api/v1"

	"github.com/gin-gonic/gin"
)

type BeepRouter struct {
}

func (*BeepRouter) BeepRouterInit(router *gin.Engine) {
	api := v1.ApiEnter.BeepApi
	{
		router.POST("beep", api.BeepAction)
	}
}
