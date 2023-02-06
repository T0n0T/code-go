package request

import (
	"strconv"

	"github.com/gin-gonic/gin"
)

// Restful风格指的是网络应用中就是资源定位和资源操作的风格。不是标准也不是协议。
// GET：从服务器取出资源（一项或多项）
// POST：在服务器新建一个资源
// PUT：在服务器更新资源（客户端提供完整资源数据）
// PATCH：在服务器更新资源（客户端提供需要修改的资源数据）
// DELETE：从服务器删除资源

type msgpack struct {
	Status int    `json:"状态"`
	Data   any    `json:"数据"`
	Msg    string `json:"信息"`
}

var UserList []User = []User{
	{"三夏", "female"},
	{Name: "馨然", Sex: "female"},
	{"大雄", "male"},
}

func RequestGetList(ctx *gin.Context) {

	ctx.JSON(200, msgpack{0, UserList, "成功"})
}

func RequestGetDetails(ctx *gin.Context) {
	id, _ := strconv.Atoi(ctx.Param("id"))
	if id < len(UserList) {
		ctx.JSON(200, msgpack{0, UserList[id], "成功"})
	} else {
		ctx.JSON(200, msgpack{0, "NULL", "无数据"})
	}
}

func RequestCreate(ctx *gin.Context) {
	var data User
	err := Bindjson(ctx, &data)
	if err != nil {
		ctx.JSON(200, msgpack{0, "NULL", "修改失败"})
		return
	}
	append(UserList, data)
	ctx.JSON(200, gin.H{})
}

func RequestUpdate(ctx *gin.Context) {
	ctx.JSON(200, gin.H{})
}

func RequestDelete(ctx *gin.Context) {
	ctx.JSON(200, gin.H{})
}

func TestApi(router *gin.Engine) {
	router.GET("/apitest", RequestGetList)
	router.GET("/apitest/:id", RequestGetDetails)

	// router.POST("/apitest", RequestCreate)

	// router.PUT("/apitest/:id", RequestUpdate)

	// router.DELETE("/apitest", RequestDelete)

}
