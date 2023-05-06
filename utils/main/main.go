package main

import (
	"fmt"
	"utils"
)

func main() {
	// err := utils.ZipFiles("./aaa/123.zip", []string{"./aaa/1.txt", "./aaa/2.txt", "./aaa/3.txt"}, "./aaa/", "")
	// _, err := utils.Unzip("./aaa/123.zip", "./aaa/")

	err := utils.ZipFiles("backup.zip", []string{"/postgresql/backup/db.dump"}, "/postgresql/backup/", "")
	fmt.Println(err)
}
