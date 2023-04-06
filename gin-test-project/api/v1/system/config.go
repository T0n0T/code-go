package system

import (
	"encoding/json"

	"gin-test-project/utils"
	pkgfile "gin-test-project/utils/file"

	"github.com/gin-gonic/gin"
)

type ConfigApi struct {
}

func (*ConfigApi) WriteConfig(c *gin.Context) {
	var NewConfig utils.Config
	if err := c.ShouldBindJSON(&NewConfig); err != nil {
		utils.FailWithMessage("配置上传解析失败...", c)
		return
	}
	str, _ := json.MarshalIndent(&NewConfig, "", "\t")
	pkgfile.WriteStringToFile("./json_config.json", string(str))
	utils.OkWithMessage("配置写入成功...", c)
}

func (*ConfigApi) ReadConfig(c *gin.Context) {
	str := pkgfile.ReadFile("./json_config.json")
	CurConfig := utils.Config{}
	if err := json.Unmarshal([]byte(str), &CurConfig); err != nil {
		utils.FailWithMessage("配置读取解析失败...", c)
		return
	}
	utils.OkWithData(&CurConfig, c)
}
