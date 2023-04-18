package main

import (
	"fmt"
	"utils"
)

func main() {
	// err := utils.ZipFiles("./utils/aaa/123.zip", []string{"./utils/aaa/1.txt", "./utils/aaa/2.txt", "./utils/aaa/3.txt"}, "./utils/aaa/", ".")
	a, err := utils.Unzip("./utils/aaa/123.zip", "./utils/aaa/")
	fmt.Println(a)
	fmt.Println(err)
}
