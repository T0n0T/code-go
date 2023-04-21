package main

import (
	"fmt"
	"gin-study/middleware"
	"gin-study/request"
	"gin-study/response"
	"log"
	"net/http"
	"os"
	"path/filepath"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	//html模版加载
	router.LoadHTMLGlob("./template/*")
	//加载静态资源，静态资源的本地路径是相对go.mod而言的
	router.StaticFile("/jpg", "./static/test.jpg")
	router.StaticFS("/staticfile", http.Dir("./static"))

	//打印当前程序所在路径
	dir, err := filepath.Abs(filepath.Dir(os.Args[0]))
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(dir)

	//中间件的加载要在所需要插入的路由前,中间件函数也可以直接在路由方法中放置于函数处
	middleware.TestMiddle(router)
	request.TestApi(router)
	request.TestBind(router)

	{
		//json调用
		router.GET("/", response.ResponseString)
		router.GET("/json", response.ResponseJson)
		router.GET("/json2", response.ResponseJsonMap)
		router.GET("/json3", response.ResponseJsonH)

		//html调用
		router.GET("/html", response.ResponseHtml)

		//文件上传
		router.POST("/upload", response.ResponseFile)

		//重定向
		router.GET("/redirect", response.ResponseRedirect)
	}

	{
		router.GET("/query", request.RequestQuery)
		router.GET("/param/:user/:id", request.RequestParam)
		router.POST("/raw", request.RequestRawData)
	}

	router.Run(":8080")
}
