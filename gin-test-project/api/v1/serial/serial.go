package serial

import (
	"net/http"
	"test/gin-test-project/model"
	"test/gin-test-project/utils"

	goserial "go.bug.st/serial"

	"github.com/gin-gonic/gin"
	"github.com/olahol/melody"
)

type SerialApi struct {
}

func (*SerialApi) SerialGetList(c *gin.Context) {
	list, err := goserial.GetPortsList()
	if err != nil {
		utils.FailWithMessage("获取串口设备失败...", c)
		return
	}
	c.JSON(http.StatusOK, list)
}

func (*SerialApi) SerialAction(c *gin.Context) {
	var cfg_json model.SerialStruct
	var cfg goserial.Mode
	err := c.BindJSON(&cfg_json)
	if err != nil {
		utils.FailWithMessage("串口配置错误...", c)
	}

	cfg.BaudRate = cfg_json.Baudrate
	cfg.DataBits = cfg_json.StopBit
	cfg.Parity = goserial.Parity(cfg_json.Parity)
	m := melody.New()

}
