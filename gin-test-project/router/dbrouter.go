package router

import (
	"fmt"
	apiv1 "test/gin-test-project/api"

	"github.com/gin-gonic/gin"
)

type DbRouter struct {
}

func (*DbRouter) DbRouterInit(router *gin.Engine) {
	fmt.Println()
	dbr := router.Group("Db")
	routerapi := apiv1.DbApi{}
	{
		dbr.POST("change", routerapi.CreateLoraStruct)
		dbr.DELETE("change", routerapi.CreateLoraStruct)
		dbr.DELETE("change", routerapi.CreateLoraStruct)
		dbr.PUT("change", routerapi.CreateLoraStruct)
		dbr.GET("change", routerapi.CreateLoraStruct)
	}

}
