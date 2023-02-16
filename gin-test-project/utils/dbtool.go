package utils

import (
	"database/sql"
	"fmt"
	"time"

	_ "github.com/go-sql-driver/mysql"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

type UserInfo struct {
	gorm.Model
	Name     string
	Age      sql.NullInt64
	Birthday *time.Time
	Email    string `gorm:"type:varchar(100);unique_index"` //唯一索引
	Role     string `gorm:"size:255"`
	Member   string `gorm:"unique;not null"`
	Num      string `gorm:"AUTO_INCREMENT"` //自增
	Address  string `gorm:"index:addr"`     //addr 为索引
	Ignore   int    `gorm:"-"`
}

func (UserInfo) TableName() string {
	return "UserInfo"
}

type Mysql struct {
}

var Db *Mysql = nil

func (*Mysql) InitSql(cfg *Config) (db *gorm.DB, err error) {
	dsn := cfg.Dbuser + ":@tcp(" + cfg.Dbhost + ":" + cfg.Dbport + ")/" + cfg.Dbname + "?charset=utf8mb4&parseTime=True&loc=Local"
	db, err = gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		fmt.Println("mysql连接失败")
		return
	}

	// db.AutoMigrate(&UserInfo{})
	return
}

func (*Mysql) Export(cfg *Config) {
	go func() {
		RunCommand("./", "mysqldump", "-u"+cfg.Dbuser, "-p"+cfg.Dbpasswd, "gva", "-r"+"./gva.sql")
	}()
}

func (*Mysql) Import(db *gorm.DB) {
	// db.Exec("source ./gva.sql")
	mysql, err := db.DB()
	if err != nil {
		return
	}

	_, err = mysql.Exec("source ./gva.sql")
	fmt.Println(err.Error())
}
