package utils

import (
	"sync"

	"gorm.io/gorm"
)

var (
	PROJ_Config Config
	PROJ_DB     *Mysql
	PROJ_DBList map[string]*gorm.DB
	lock        sync.RWMutex
)

func GetGlobalDBByDBName(dbname string) *gorm.DB {
	lock.RLock()
	defer lock.RUnlock()
	return PROJ_DBList[dbname]
}

// MustGetGlobalDBByDBName 通过名称获取db 如果不存在则panic
func MustGetGlobalDBByDBName(dbname string) *gorm.DB {
	lock.RLock()
	defer lock.RUnlock()
	db, ok := PROJ_DBList[dbname]
	if !ok || db == nil {
		panic("db no init")
	}
	return db
}
