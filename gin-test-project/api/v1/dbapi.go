package v1

import (
	"fmt"
	"test/gin-test-project/model"

	"github.com/gin-gonic/gin"
)

type DbloraApi struct {
}

func (r *DbloraApi) CreateLoraStruct(c *gin.Context) {
	var loraStruct model.LoraStruct
	err := c.ShouldBindJSON(&loraStruct)
	if err != nil {
		fmt.Println("lora配置适配失败...")
		return
	}
	// if err := (loraStruct); err != nil {
	// 	fmt.Println("条目创建失败...")
	// } else {
	// 	fmt.Println("条目创建成功", c)
	// }
}

func (r *DbloraApi) DeleteLoraStruct(c *gin.Context) {
	var loraStruct model.LoraStruct
	err := c.ShouldBindJSON(&loraStruct)
	if err != nil {
		fmt.Println("数据库操作解析失败...")
		return
	}
	// if err := (loraStruct); err != nil {
	// 	fmt.Println("条目创建失败...")
	// } else {
	// 	fmt.Println("条目创建成功", c)
	// }
}

func (r *DbloraApi) UpdateLoraStruct(c *gin.Context) {
	var loraStruct model.LoraStruct
	err := c.ShouldBindJSON(&loraStruct)
	if err != nil {
		fmt.Println("数据库操作解析失败...")
		return
	}
	// if err := (loraStruct); err != nil {
	// 	fmt.Println("条目创建失败...")
	// } else {
	// 	fmt.Println("条目创建成功", c)
	// }
}

func (r *DbloraApi) GetLoraStruct(c *gin.Context) {
	var loraStruct model.LoraStruct
	err := c.ShouldBindJSON(&loraStruct)
	if err != nil {
		fmt.Println("数据库操作解析失败...")
		return
	}
	// if err := (loraStruct); err != nil {
	// 	fmt.Println("条目创建失败...")
	// } else {
	// 	fmt.Println("条目创建成功", c)
	// }
}
