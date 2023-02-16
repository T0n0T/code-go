package model

import "gorm.io/gorm"

type LoraStruct struct {
	gorm.Model
	Dev_name string `json:"dev_name" form:"dev_name" gorm:"column:dev_name;comment:;"`
	Mqtt_ip  string `json:"mqtt_ip" form:"mqtt_ip" gorm:"column:mqtt_ip;comment:;"`
	Version  string `json:"version" form:"version" gorm:"column:version;comment:;"`
	LoraUid  string `json:"loraUid" form:"loraUid" gorm:"column:lora_uid;comment:;"`
	RFID     string `json:"rFID" form:"rFID" gorm:"column:r_f_i_d;comment:;"`
}

// TableName LoraStruct 表名
func (LoraStruct) TableName() string {
	return "llll"
}
