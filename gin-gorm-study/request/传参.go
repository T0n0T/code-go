package request

import (
	"encoding/json"
	"fmt"

	"github.com/gin-gonic/gin"
)

type User struct {
	Name string `json:"name"`
	Sex  string `json:"sex"`
}

func Bindjson(ctx *gin.Context, obj any) error {
	body, _ := ctx.GetRawData()
	rawtype := ctx.GetHeader("Content-Type")
	if rawtype == "application/json" {

		// fmt.Println(string(body))
		err := json.Unmarshal(body, &obj)
		if err != nil {
			return err
		}
	}
	return nil
}

func RequestQuery(ctx *gin.Context) {
	//第一种取传参
	// user := ctx.Query("user")
	//第二种自动解析
	str, _ := ctx.GetQuery("user")
	// slice, _ := ctx.GetQueryArray("user") // 拿到多个相同的查询参数
	// m, _ := ctx.GetQueryMap("user")
	// fmt.Println(user)
	fmt.Println(str)
}

func RequestParam(ctx *gin.Context) {
	str1 := ctx.Param("user")
	str2 := ctx.Param("id")

	fmt.Println("user:", str1, "id:", str2)
}

// 获取原始值,后续接入处理
func RequestRawData(ctx *gin.Context) {
	var a User
	err := Bindjson(ctx, &a)
	if err == nil {
		fmt.Println(a)
	}
}
