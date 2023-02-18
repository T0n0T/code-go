package lora

import (
	v1 "test/gin-test-project/api/v1"

	"github.com/gin-gonic/gin"
)

type DbRouter struct {
}

func (*DbRouter) DbRouterInit(router *gin.Engine) {
	dbr := router.Group("Db")
	routerapi := v1.ApiEnter.DbloraApi
	{
		dbr.POST("lora", routerapi.CreateLoraStruct)
		dbr.DELETE("lora", routerapi.DeleteLoraStruct)
		dbr.PUT("lora", routerapi.UpdateLoraStruct)
		dbr.GET("lora", routerapi.GetLoraStruct)
	}
}
