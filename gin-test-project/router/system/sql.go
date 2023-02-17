package system

import (
	v1 "test/gin-test-project/api/v1"

	"github.com/gin-gonic/gin"
)

type SqlRouter struct {
}

func (*SqlRouter) SqlRouterInit(router *gin.Engine) {
	dbr := router.Group("sql")
	routerapi := v1.ApiEnter.SqlApi
	{
		dbr.GET("export", routerapi.Export)
		dbr.POST("import", routerapi.Import)
	}
}
