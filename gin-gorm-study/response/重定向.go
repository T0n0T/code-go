package response

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func ResponseRedirect(ctx *gin.Context) {
	// code:301 缓冲完毕后,下次get请求会直接跳转到重定向位置
	ctx.Redirect(http.StatusMovedPermanently, "http://www.baidu.com/")
	// code:302 不会缓冲,下次get请求会再次经过重定向
	// ctx.Redirect(http.StatusFound, "https://www.baidu.com")
}
