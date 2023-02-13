package main

import (
	"test/gin-test-project/utils"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	cfg, err := utils.ConfigParse("./json_config.json")
	if err != nil {
		panic(err.Error())
	}
	r.Run(cfg.Host + ":" + cfg.Port)
}
