package apiv1

import (
	"fmt"
	"test/gin-test-project/model"

	"github.com/gin-gonic/gin"
)

type DbApi struct {
}

func (r *DbApi) CreateLoraStruct(c *gin.Context) {
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
