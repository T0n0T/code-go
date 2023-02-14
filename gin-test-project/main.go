package main

import (
	"fmt"
	"test/gin-test-project/utils"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	cfg, err := utils.ConfigParse("./json_config.json")
	if err != nil {
		panic(err.Error())
	}
	utils.DbExport(cfg)
	fmt.Println(cfg)
	r.Run(cfg.Host + ":" + cfg.Port)
}
