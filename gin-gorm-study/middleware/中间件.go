package middleware

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

func PrintfInfo() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		fmt.Println("---------------------------------")
		fmt.Println(ctx.FullPath(), ctx.Request.Method)
		//使用GET方法时第一次会返回200
		fmt.Println(ctx.Writer.Status())
		fmt.Println("---------------------------------")

		//context.next中断执行,会在ctx被收回时(请求处理完毕)继续执行,将中间件分为两部分执行
		ctx.Next()
		fmt.Println("---------------------------------")
		fmt.Println(ctx.Writer.Status())
		fmt.Println("---------------------------------")
	}
}

func TestMiddle(router *gin.Engine) {
	router.Use(PrintfInfo())
	// router.Use(func(ctx *gin.Context) {
	// 	fmt.Println(ctx.FullPath())
	// 	fmt.Println(ctx.Request.Method)
	// })

}
