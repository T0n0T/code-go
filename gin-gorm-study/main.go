package main

import (
	"net/http"
	"test/gin-gorm-study/request"
	"test/gin-gorm-study/response"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	//html模版加载
	// router.LoadHTMLGlob("gin-gorm-study/template/*")
	//加载静态资源，静态资源的本地路径是相对go.mod而言的
	router.StaticFile("/jpg", "gin-gorm-study/static/test.jpg")
	router.StaticFS("/staticfile", http.Dir("gin-gorm-study/static"))

	{
		//json调用
		router.GET("/", response.ResponseString)
		router.GET("/json", response.ResponseJson)
		router.GET("/json2", response.ResponseJsonMap)
		router.GET("/json3", response.ResponseJsonH)

		//html调用
		router.GET("/html", response.ResponseHtml)

		//重定向
		router.GET("/redirect", response.ResponseRedirect)
	}
	{
		router.GET("/query", request.RequestQuery)
		router.GET("/param/:user/:id", request.RequestParam)
		router.POST("/raw", request.RequestRawData)
	}
	request.TestApi(router)
	request.TestBind(router)
	router.Run(":8080")
}
