package pkgfile

import (
	"io/ioutil"
	"log"
	"os"
)

// IsExists 判断所给路径文件/文件夹是否存在
func IsExists(path string) bool {
	_, err := os.Stat(path) //os.Stat获取文件信息
	if err != nil && !os.IsExist(err) {
		return false
	}
	return true
}

// IfNoFileToCreate 文件不存在就创建文件
func IfNoFileToCreate(fileName string) (file *os.File) {
	var f *os.File
	var err error
	if !IsExists(fileName) {
		f, err = os.Create(fileName)
		if err != nil {
			return
		}
		log.Printf("成功创建文件:%s", fileName)
		defer f.Close()
	}
	return f
}

// 通过 ioutil.WriteFile 写入文件
func WriteStringToFile(fileName string, writeInfo string) {
	_ = IfNoFileToCreate(fileName)
	info := []byte(writeInfo)
	if err := ioutil.WriteFile(fileName, info, 0666); err != nil {
		log.Printf("写入文件失败:%+v", err)
		return
	}
	log.Printf("写入文件成功")
}

// R使用ioutil.ReadFile 直接从文件读取到 []byte中
func ReadFile(fileName string) string {
	f, err := ioutil.ReadFile(fileName)
	if err != nil {
		log.Printf("读取文件失败:%#v", err)
		return ""
	}
	return string(f)
}
