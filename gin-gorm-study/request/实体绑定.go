package request

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

type Student struct {
	Name  string `form:"name" binding:"required"`
	Class string `form:"class" binding:"required"`
}

// bind方法有几种,基础的bind方法使用content-type解析
// bindjson等会在bind基础上传入指定的type解析,解析错误给出返回码400,bindwith也属于这类
// shouldbindjson等会在bindjson的基础上去除自动返回码400,返回码由编写者在下文给出
func TestBind(router *gin.Engine) {
	var stu Student
	//使用get和post最本质的区别在于,
	//get会在url显示,header和数据实体会一起传输
	//post会先释放header,再包装request.data再传输
	router.GET("/bind", func(ctx *gin.Context) {
		//从url中获取学生的表单信息
		if err := ctx.ShouldBindQuery(&stu); err != nil {
			fmt.Println(err)
			return
		}
		ctx.Writer.Write([]byte("hello," + stu.Name + " getbind"))
	})

	router.POST("/bind", func(ctx *gin.Context) {
		//从postform中获取学生的表单信息
		if err := ctx.ShouldBind(&stu); err != nil {
			fmt.Println(err)
			return
		}
		ctx.Writer.Write([]byte("hello," + stu.Name + " postbind"))
	})

	router.POST("/bindjson", func(ctx *gin.Context) {
		//从postform中获取学生的表单信息
		if err := ctx.ShouldBindJSON(&stu); err != nil {
			fmt.Println(err)
			return
		}
		// ctx.Writer.Write([]byte("hello," + stu.Name + " postbindjson"))
		ctx.JSON(200, "hello,"+stu.Name+" postbindjson")

	})
}
