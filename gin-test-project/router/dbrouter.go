package router

import (
	"fmt"
	v1 "test/gin-test-project/api/v1"

	"github.com/gin-gonic/gin"
)

type DbRouter struct {
}

func (*DbRouter) DbRouterInit(router *gin.Engine) {
	fmt.Println()
	dbr := router.Group("Db")
	routerapi := v1.ApiEnter.LoraApigroup
	{
		dbr.POST("change", routerapi.CreateLoraStruct)
		dbr.DELETE("change", routerapi.DeleteLoraStruct)
		dbr.PUT("change", routerapi.UpdateLoraStruct)
		dbr.GET("change", routerapi.GetLoraStruct)
	}
}
