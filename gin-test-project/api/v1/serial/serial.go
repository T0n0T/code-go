package serial

import (
	"net/http"
	"test/gin-test-project/model"
	"test/gin-test-project/service"
	"test/gin-test-project/utils"

	"github.com/gin-gonic/gin"
)

type SerialApi struct {
}

var SerialServ = service.ServiceEnter.SerialService

func (*SerialApi) SerialGetList(c *gin.Context) {
	List, err := SerialServ.GetSerialList()
	if err != nil {
		utils.FailWithMessage("获取串口设备失败...", c)
		return
	}
	c.JSON(http.StatusOK, List)
}

func (s *SerialApi) SerialOpen(c *gin.Context) {
	SerialServ.OpenServ(c)
	utils.OkWithMessage("串口关闭...", c)
}

func (s *SerialApi) SerialSet(c *gin.Context) {
	var cfg_json model.SerialStruct
	err := c.BindJSON(&cfg_json)
	if err != nil {
		utils.FailWithMessage("串口配置错误...", c)
	}
	SerialServ.SetConfig(cfg_json)
	utils.OkWithMessage("串口配置完成...", c)
}
