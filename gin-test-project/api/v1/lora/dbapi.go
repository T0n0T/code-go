package lora

import (
	"fmt"
	"gin-test-project/model"
	"gin-test-project/utils"

	"gin-test-project/service"

	"github.com/gin-gonic/gin"
)

type DbloraApi struct {
}

var loraServ = service.ServiceEnter.LoraService

func (r *DbloraApi) CreateLoraStruct(c *gin.Context) {
	var loraStruct model.LoraStruct
	err := c.ShouldBindJSON(&loraStruct)
	if err != nil {
		utils.FailWithMessage("lora配置适配失败...", c)
		return
	}
	if err := loraServ.Create(loraStruct); err != nil {
		utils.FailWithMessage("条目创建失败...", c)
	} else {
		utils.OkWithMessage("条目创建成功", c)
	}
}

func (r *DbloraApi) DeleteLoraStruct(c *gin.Context) {
	var IDS model.IdsReq
	err := c.ShouldBindJSON(&IDS)
	if err != nil {
		utils.FailWithMessage("待删除条目id解析失败...", c)
		return
	}
	if err := loraServ.Delete(IDS); err != nil {
		utils.FailWithMessage("条目删除失败...", c)
	} else {
		utils.OkWithMessage("条目删除成功", c)
	}
}

func (r *DbloraApi) UpdateLoraStruct(c *gin.Context) {
	var loraStruct model.LoraStruct
	err := c.ShouldBindJSON(&loraStruct)
	if err != nil {
		utils.FailWithMessage("数据库操作解析失败...", c)
		return
	}
	if err := loraServ.Update(loraStruct.ID, loraStruct); err != nil {
		utils.FailWithMessage("条目更新失败...", c)
	} else {
		utils.OkWithMessage("条目更新成功", c)
	}
}

func (r *DbloraApi) GetLoraStruct(c *gin.Context) {
	var loraStruct model.LoraStruct
	err := c.ShouldBindQuery(&loraStruct)
	if err != nil {
		utils.FailWithMessage(err.Error(), c)
		return
	}
	fmt.Println(loraStruct)
	if reloraStruct, err := loraServ.Get(loraStruct.ID); err != nil {
		utils.FailWithMessage("查询失败", c)
	} else {
		utils.OkWithData(gin.H{"reloraStruct": reloraStruct}, c)
	}
}
