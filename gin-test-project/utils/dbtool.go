package utils

import (
	"fmt"
	"gin-test-project/model"
	"io/ioutil"
	"log"
	"os"
	"strings"

	_ "github.com/go-sql-driver/mysql"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

type Mysql struct {
	DB *gorm.DB
}

func (*Mysql) InitSql(cfg *Config) (db *gorm.DB, err error) {
	dsn := cfg.Dbuser + ":@tcp(" + cfg.Dbhost + ":" + cfg.Dbport + ")/" + cfg.Dbname + "?charset=utf8mb4&parseTime=True&loc=Local"
	db, err = gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		fmt.Println("mysql连接失败")
		return
	}
	RegisTable(db)
	// sql, _ := PROJ_DB.DB.DB()
	// defer sql.Close()
	return
}

func (*Mysql) Export(cfg *Config) {
	go RunCommand("./", "mysqldump", "-u"+cfg.Dbuser, "-p"+cfg.Dbpasswd, "gva", "-r"+"./tmp/gva.sql")
}

func (*Mysql) Import(db *gorm.DB) (err error) {
	sqls, _ := ioutil.ReadFile("./tmp/gva.sql")
	sqlArr := strings.Split(string(sqls), ";")
	for _, sql := range sqlArr {
		sql = strings.TrimSpace(sql)
		if sql == "" {
			continue
		}
		err := db.Exec(sql).Error
		if err != nil {
			log.Println("数据库导入失败:" + err.Error())
			return err
		} else {
			log.Println(sql, "\t success!")
		}
	}
	fmt.Println(err.Error())
	return
}

func RegisTable(db *gorm.DB) {
	err := db.AutoMigrate(model.LoraStruct{})
	if err != nil {
		fmt.Println("表单初始化失败...")
		os.Exit(0)
	}
	fmt.Println("表单初始化成功...")
}
