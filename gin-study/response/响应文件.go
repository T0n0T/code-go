package response

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

func ResponseFile(ctx *gin.Context) {
	file, err := ctx.FormFile("pre-upload")
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"message": err.Error(),
		})
		return
	}
	fmt.Println(file.Filename)
	dst := fmt.Sprintf("./save/%s", file.Filename)
	ctx.SaveUploadedFile(file, dst)
	ctx.JSON(http.StatusOK, gin.H{
		"message": fmt.Sprintf("'%s' upload success!", file.Filename),
	})
}
