package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func ResponseString(ctx *gin.Context) {
	ctx.String(http.StatusOK, "你好")
}

func ResponseJson(ctx *gin.Context) {
	type Userinfo struct {
		Name   string `json:"user_name"`
		Age    int    `json:"age"`
		Passwd string `json:"-"`
	}
	user := Userinfo{"牛子", 4, "123456"}
	ctx.JSON(http.StatusOK, user)
}

func ResponseJsonMap(ctx *gin.Context) {
	userMap := map[string]string{
		"user_name": "妞儿",
		"age":       "22",
		"passwd":    "123456",
	}
	ctx.JSON(http.StatusOK, userMap)
}

func ResponseJsonH(ctx *gin.Context) {

	ctx.JSON(http.StatusOK, gin.H{"user_name": "三夏", "age": "22", "passwd": "123456"})
}
