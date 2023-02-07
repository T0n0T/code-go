package request

import (
	"encoding/json"
	"fmt"
	"os"
	"strconv"
	pkgfile "test/file"

	"github.com/gin-gonic/gin"
)

// Restful风格指的是网络应用中就是资源定位和资源操作的风格。不是标准也不是协议。
// GET：从服务器取出资源（一项或多项）
// POST：在服务器新建一个资源
// PUT：在服务器更新资源（客户端提供完整资源数据）
// PATCH：在服务器更新资源（客户端提供需要修改的资源数据）
// DELETE：从服务器删除资源

var FileName string = "F:\\-code-go\\go-study\\config_test.json"

type msgpack struct {
	Status int    `json:"状态"`
	Data   any    `json:"数据"`
	Msg    string `json:"信息"`
}

func ReadJson(config_path string) interface{} {
	var temp interface{}
	var value User
	var List []User
	id := 0

	fp, err := os.Open(config_path)
	if err != nil {
		fmt.Printf("读取文件失败:%#v", err)
		return ""
	}

	if err = json.NewDecoder(fp).Decode(&temp); err != nil {
		fmt.Printf("文件解析失败:%#v", err)
		return ""
	}

	for _, idv := range temp.(map[string]interface{}) {

		jsonstr, _ := json.Marshal(idv)
		json.Unmarshal(jsonstr, &value)

		List = append(List, value)
		id++
	}
	str, _ := json.Marshal(List)
	fmt.Println(string(str))

	return List
}

func WriteJson(config_path string, json_data []User) {
	var str string
	for _, idv := range json_data {
		jsonstr, _ := json.Marshal(idv)
		str = string(jsonstr) + str
	}

	pkgfile.WriteStringToFile(config_path, string(str))
}

func RequestGetList(ctx *gin.Context) {
	var UserList = ReadJson(FileName)
	ctx.JSON(200, msgpack{0, UserList.([]User), "成功"})
}

func RequestGetDetails(ctx *gin.Context) {
	var UserList = ReadJson(FileName)
	id, _ := strconv.Atoi(ctx.Param("id"))
	if id < len(UserList.([]User)) {
		ctx.JSON(200, msgpack{0, UserList.([]User)[id], "成功"})
	} else {
		ctx.JSON(200, msgpack{0, "NULL", "无数据"})
	}
}

// func RequestMultiCreate(ctx *gin.Context) {

// 	var data MultiUser
// 	var tempList = ReadJson(FileName)
// 	UserList := tempList.([]User)
// 	err := Bindjson(ctx, &data)
// 	if err != nil {
// 		ctx.JSON(200, msgpack{0, "NULL", "修改失败"})
// 		return
// 	}

// 	// for i := 0; i < len(data); i++ {
// 	// 	UserList = append(UserList, data[i])
// 	// }
// 	UserList = append(UserList, data.Temp, data.Temp2)
// 	ctx.JSON(200, msgpack{0, UserList, "成功"})
// }

func RequestCreate(ctx *gin.Context) {
	var data User
	var tempList = ReadJson(FileName)
	UserList := tempList.([]User)

	if err := Bindjson(ctx, &data); err != nil {
		ctx.JSON(200, msgpack{0, "NULL", "创建失败"})
		return
	}
	UserList = append(UserList, data)
	WriteJson(FileName, UserList)
	ctx.JSON(200, msgpack{0, UserList, "创建成功"})
}

func RequestUpdate(ctx *gin.Context) {
	var data User
	id, _ := strconv.Atoi(ctx.Param("id"))

	var tempList = ReadJson(FileName)
	UserList := tempList.([]User)

	if err := Bindjson(ctx, &data); err != nil {
		ctx.JSON(200, msgpack{0, "NULL", "待更改数据解析失败"})
		return
	}

	if id < len(UserList) {
		UserList[id] = data
		ctx.JSON(200, msgpack{0, UserList, "更改成功"})
	} else {
		ctx.JSON(200, msgpack{0, "NULL", "更改失败"})
	}

}

func RequestDelete(ctx *gin.Context) {
	ctx.JSON(200, gin.H{})
}

func TestApi(router *gin.Engine) {
	router.GET("/apitest", RequestGetList)
	router.GET("/apitest/:id", RequestGetDetails)

	router.POST("/apitest", RequestCreate)

	// router.PUT("/apitest/:id", RequestUpdate)

	// router.DELETE("/apitest", RequestDelete)

}
