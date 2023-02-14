package utils

import (
	"database/sql"
	"time"

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

func InitMysql(cfg *Config) *gorm.DB {
	dsn := cfg.Dbuser + ":@tcp(" + cfg.Dbhost + ":" + cfg.Dbport + ")/" + cfg.Dbname + "?charset=utf8mb4&parseTime=True&loc=Local"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic(err)
	}

	db.AutoMigrate(&UserInfo{})
	return db
}

func DbExport(db *gorm.DB, cfg *Config) {
	RunCommand("./", "mysqldump", "-h", cfg.Dbhost+":"+cfg.Dbport, "-p", cfg.Dbuser, "-p", cfg.Dbpasswd, "gva>./gva.sql")
}
