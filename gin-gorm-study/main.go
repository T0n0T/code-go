package main

import (
	"test/html"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	//html模版加载
	router.LoadHTMLGlob("template/*")
	//加载静态资源，静态资源的本地路径是相对go.mod而言的
	router.StaticFile("/jpg", "static/test.jpg")

	//json调用
	router.GET("/", ResponseString)
	router.GET("/json", ResponseJson)
	router.GET("/json2", ResponseJsonMap)
	router.GET("/json3", ResponseJsonH)

	//html调用
	router.GET("/html", html.ResponseHtml)

	router.Run(":8080")
}
