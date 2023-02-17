package model

import (
	"database/sql"
	"time"

	"gorm.io/gorm"
)

type LoraStruct struct {
	gorm.Model
	Dev_name string `json:"dev_name" form:"dev_name" gorm:"column:dev_name;comment:;"`
	Mqtt_ip  string `json:"mqtt_ip" form:"mqtt_ip" gorm:"column:mqtt_ip;comment:;"`
	Version  string `json:"version" form:"version" gorm:"column:version;comment:;"`
	LoraUid  string `json:"loraUid" form:"loraUid" gorm:"column:lora_uid;comment:;"`
	RFID     string `json:"rFID" form:"rFID" gorm:"column:r_f_i_d;comment:;"`
}

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

// TableName LoraStruct 表名
func (LoraStruct) TableName() string {
	return "llllo"
}

type IdsReq struct {
	Ids []int `json:"ids" form:"ids"`
}
