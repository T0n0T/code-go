package request

import (
	"encoding/json"
	"fmt"
	pkgfile "gin-gorm-study/file"
	"os"
	"strconv"

	"github.com/gin-gonic/gin"
)

// Restful风格指的是网络应用中就是资源定位和资源操作的风格。不是标准也不是协议。
// GET：从服务器取出资源（一项或多项）
// POST：在服务器新建一个资源
// PUT：在服务器更新资源（客户端提供完整资源数据）
// PATCH：在服务器更新资源（客户端提供需要修改的资源数据）
// DELETE：从服务器删除资源

var FileName string = "../config_test.json"

type msgpack struct {
	Status int    `json:"状态"`
	Data   any    `json:"数据"`
	Msg    string `json:"信息"`
}

type tagpack struct {
	Num   interface{} `json:"num"`
	Value []User      `json:"value"`
}

func ReadJson(config_path string) (num interface{}, value []User) {
	var temp interface{}

	fp, err := os.Open(config_path)
	if err != nil {
		fmt.Printf("读取文件失败:%#v", err)
		return nil, nil
	}

	if err = json.NewDecoder(fp).Decode(&temp); err != nil {
		fmt.Printf("文件解析失败:%#v", err)
		return nil, nil
	}
	defer fp.Close()

	for _, idv := range temp.(map[string]interface{}) {
		switch idvType := idv.(type) {
		case int, float32, float64:
			num = idvType
		case []interface{}:
			var tmp User
			for _, idvv := range idvType {
				jsonstr, _ := json.Marshal(idvv)
				json.Unmarshal(jsonstr, &tmp)
				value = append(value, tmp)
			}
		default:
			fmt.Println("配置文件含有未解析数据")
		}
	}

	return num, value
}

func WriteJson(config_path string, num int, json_data []User) {
	sendpack := tagpack{Num: num, Value: json_data}
	str, _ := json.MarshalIndent(sendpack, "", "\t")
	pkgfile.WriteStringToFile(config_path, string(str))
}

func requestGetList(ctx *gin.Context) {
	num, UserList := ReadJson(FileName)
	ctx.IndentedJSON(200, msgpack{0, tagpack{num, UserList}, "成功"})
}

func requestGetDetails(ctx *gin.Context) {
	_, UserList := ReadJson(FileName)
	id, _ := strconv.Atoi(ctx.Param("id"))
	if id < len(UserList) {
		ctx.IndentedJSON(200, msgpack{0, UserList[id], "成功"})
	} else {
		ctx.IndentedJSON(200, msgpack{0, "NULL", "无数据"})
	}
}

func requestCreate(ctx *gin.Context) {

	_, UserList := ReadJson(FileName)

	data, err := Bindjson(ctx)
	if err != nil {
		ctx.IndentedJSON(200, msgpack{0, "NULL", "创建失败"})
		return
	}
	fmt.Println(data)
	fmt.Println("here")

	UserList = append(UserList, data.([]User)...)
	WriteJson(FileName, len(UserList), UserList)
	ctx.IndentedJSON(200, msgpack{0, tagpack{len(UserList), UserList}, "创建成功"})
}

func requestUpdate(ctx *gin.Context) {
	id, _ := strconv.Atoi(ctx.Param("id"))
	_, UserList := ReadJson(FileName)

	data, err := Bindjson(ctx)
	if err != nil {
		ctx.IndentedJSON(200, msgpack{0, "NULL", "创建失败"})
		return
	}

	if id < len(UserList) {
		UserList[id] = data.(User)
		WriteJson(FileName, len(UserList), UserList)
		ctx.IndentedJSON(200, msgpack{0, tagpack{len(UserList), UserList}, "更改成功"})
	} else {
		ctx.IndentedJSON(200, msgpack{0, "NULL", "更改失败"})
	}

}

func requestDelete(ctx *gin.Context) {
	id, _ := strconv.Atoi(ctx.Param("id"))
	_, UserList := ReadJson(FileName)
	i := 0
	for idx, idv := range UserList {
		if idx != id {
			UserList[i] = idv
			i++
		}
	}
	UserList = UserList[:i]
	WriteJson(FileName, len(UserList), UserList)
	ctx.IndentedJSON(200, msgpack{0, tagpack{len(UserList), UserList}, "删除成功"})
}

func TestApi(router *gin.Engine) {

	apitestGroup := router.Group("/apitest")
	apitestGroup.GET("/", requestGetList)
	// ":id"在字段中定义了传入的param
	apitestGroup.GET("/:id", requestGetDetails)
	apitestGroup.POST("/", requestCreate)
	apitestGroup.PUT("/:id", requestUpdate)
	apitestGroup.DELETE("/:id", requestDelete)
}
