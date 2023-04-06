package main

import (
	"fmt"
	"gin-test-project/router"
	"gin-test-project/utils"

	"github.com/gin-gonic/gin"
)

func main() {
	cfg, err := utils.ConfigParse("./json_config.json")
	utils.PROJ_Config = *cfg
	if err != nil {
		fmt.Println("配置解析失败...")
		panic(err.Error())
	}
	utils.PROJ_DB = new(utils.Mysql)
	utils.PROJ_DB.DB, _ = utils.PROJ_DB.InitSql(cfg)

	GinSTART(cfg)

}

func GinSTART(cfg *utils.Config) {
	r := gin.Default()
	router.InitRouter(r)
	r.Run(cfg.Host + ":" + cfg.Port)
}
