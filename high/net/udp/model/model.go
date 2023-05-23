package model

import (
	"time"

	"gorm.io/gorm"
)

type LedUDP struct {
	ID     int  `json:"id"`
	Status bool `json:"status"`
}

type UpdateMsg struct {
	Time     string `json:"time"`
	DataType string `json:"datatype"`
	Action   string `json:"action"`
	Data     any    `json:"data"`
}
type IPtables struct {
	ID        uint           `gorm:"primarykey"` // 主键ID
	CreatedAt time.Time      // 创建时间
	UpdatedAt time.Time      // 更新时间
	DeletedAt gorm.DeletedAt `gorm:"index" json:"-"` // 删除时间
	Eth       string         `json:"eth" form:"eth" gorm:"column:eth;comment:;"`
	Protoc    string         `json:"protocol" form:"protocol" gorm:"column:protoc;comment:;"`
	Src       string         `json:"src" form:"src" gorm:"column:src;comment:;"`
	Dst       string         `json:"dst" form:"dst" gorm:"column:dst;comment:;"`
	Sport     *int           `json:"sport" form:"sport" gorm:"column:sport;comment:;"`
	Dport     *int           `json:"dport" form:"dport" gorm:"column:dport;comment:;"`
	Action    string         `json:"action" form:"action" gorm:"column:action;comment:;"`
}
