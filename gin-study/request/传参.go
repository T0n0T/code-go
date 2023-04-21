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

// var Usertemp [2]User

// func Bindjson(ctx *gin.Context, obj any) error {
// 	body, _ := ctx.GetRawData()
// 	rawtype := ctx.GetHeader("Content-Type")
// 	var tmp interface{}

// 	fmt.Println(obj)

// 	if rawtype == "application/json" {
// 		json.Unmarshal(body, &tmp)
// 		for idx, idv := range tmp.([]interface{}) {
// 			var temp User
// 			jsonstr, _ := json.Marshal(idv)
// 			json.Unmarshal(jsonstr, &temp)
// 			Usertemp[idx] = temp
// 		}
// 	}
// 	fmt.Println(Usertemp)
// 	// copy(obj.([]User),Usertemp)
// 	obj = Usertemp

// 	fmt.Println(obj)

// 	return nil
// }

func Bindjson(ctx *gin.Context) (obj any, err error) {
	body, _ := ctx.GetRawData()
	rawtype := ctx.GetHeader("Content-Type")

	var raw []User
	var tmp interface{}

	if rawtype == "application/json" {
		if err := json.Unmarshal(body, &tmp); err != nil {
			fmt.Println("解析失败...")
		}
		for _, idv := range tmp.([]interface{}) {
			var temp User
			jsonstr, _ := json.Marshal(idv)
			json.Unmarshal(jsonstr, &temp)
			raw = append(raw, temp)
		}
	}
	obj = raw
	return obj, nil
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
	a, err := Bindjson(ctx)
	if err == nil {
		fmt.Println(a)
	}
}
