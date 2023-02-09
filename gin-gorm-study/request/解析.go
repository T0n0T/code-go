package request

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

// 与gin提供的get/post等方法相同
// Query显式获取url数据,地址栏会有参数显视
func handle_get(ctx *gin.Context) {
	path := ctx.FullPath()
	fmt.Println(path)

	name := ctx.DefaultQuery("name", "hello")
	fmt.Println(name)

	//写入返回数据
	ctx.Writer.Write([]byte("hello," + name))
}

// postform的表单提交是不会在交互过程中显示表现的
func handle_post(ctx *gin.Context) {
	path := ctx.FullPath()
	fmt.Println(path)

	username := ctx.PostForm("username")
	password := ctx.PostForm("password")
	fmt.Println(username)
	fmt.Println(password)

	//writer下可以使用writestring等直接对某种数据类型返回
	//writer是调用http包中的返回形式
	//json则是调用在writer基础上加上content-type
	ctx.Writer.Write([]byte(username + "登录成功"))

}

func TestHandle(router *gin.Engine) {
	router.Handle("GET", "/handle", handle_get)
	router.Handle("POST", "/handle", handle_post)
}
