package response

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func ResponseHtml(ctx *gin.Context) {
	ctx.HTML(http.StatusOK, "index.html", gin.H{"user_name": "四海", "age": "12", "passwd": "123456"})
}
