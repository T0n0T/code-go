package beep

import (
	beep "test/gin-test-project/api/v1/beep/cbeep"
	"test/gin-test-project/utils"

	"github.com/gin-gonic/gin"
)

type BeepApi struct {
}

// func (*BeepApi) BeepAction(c *gin.Context) {
// 	str := c.Query("action")
// 	if str == "on" {
// 		beep.BeepOn()
// 		utils.OkWithMessage("beep on", c)
// 	} else if str == "off" {
// 		beep.BeepOff()
// 		utils.OkWithMessage("beep off", c)
// 	} else {
// 		utils.FailWithMessage("wrong action.", c)
// 	}
// }

func (*BeepApi) BeepAction(c *gin.Context) {
	str := c.Query("action")
	if str == "on" {
		beep.BeepAct("1")
		utils.OkWithMessage("beep on", c)
	} else if str == "off" {
		beep.BeepAct("0")
		utils.OkWithMessage("beep off", c)
	} else {
		utils.FailWithMessage("wrong action.", c)
	}
}
