package beep

import (
	v1 "test/gin-test-project/api/v1"

	"github.com/gin-gonic/gin"
)

type BeepRouter struct {
}

func (*BeepRouter) DbRouterInit(router *gin.Engine) {
	api := v1.ApiEnter.BeepApi
	{
		router.POST("beep", api.BeepAction)
	}
}
