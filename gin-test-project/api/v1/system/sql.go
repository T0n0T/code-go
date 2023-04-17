package system

import (
	"fmt"
	"gin-test-project/utils"

	"github.com/gin-gonic/gin"
)

type SqlApi struct {
}

func (*SqlApi) Export(c *gin.Context) {
	utils.PROJ_DB.Export(&utils.PROJ_Config)

	c.Writer.Header().Add("Content-Disposition", "attachment; filename=12323.zip") //fmt.Sprintf("attachment; filename=%s", filename)对下载的文件重命名
	c.Writer.Header().Add("Content-Type", "application/octet-stream")
	c.File("./tmp/backup.zip")
}

func (*SqlApi) Import(c *gin.Context) {
	file, err := c.FormFile("importsql")
	if err != nil {
		utils.FailWithMessage("数据库备份上传失败...", c)
		return
	}
	fmt.Println(file.Filename)
	dst := fmt.Sprintf("./tmp/%s", "gva.sql")
	c.SaveUploadedFile(file, dst)
	utils.OkWithMessage("数据库备份保存成功...", c)

	if err := utils.PROJ_DB.Import(utils.PROJ_DB.DB); err != nil {
		utils.FailWithMessage("数据库导入失败...", c)
		return
	}
	utils.OkWithMessage("数据库导入成功...", c)
}
