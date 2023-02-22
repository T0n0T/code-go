package beep

import (
	"test/gin-test-project/utils"

	"github.com/gin-gonic/gin"
)

type BeepApi struct {
}

func (*BeepApi) BeepAction(c *gin.Context) {
	str := c.Query("action")
	if str == "on" {
		utils.OkWithMessage("beep off", c)
	} else if str == "off" {
		utils.OkWithMessage("beep off", c)
	} else {
		utils.Fail("wrong action.", c)
	}
}
