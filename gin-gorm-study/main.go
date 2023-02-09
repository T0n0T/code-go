package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"test/gin-gorm-study/request"
	"test/gin-gorm-study/response"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	//html模版加载
	router.LoadHTMLGlob("./template/*")
	//加载静态资源，静态资源的本地路径是相对go.mod而言的
	router.StaticFile("/jpg", "./static/test.jpg")
	router.StaticFS("/staticfile", http.Dir("./static"))

	dir, err := filepath.Abs(filepath.Dir(os.Args[0]))
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(dir)

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
