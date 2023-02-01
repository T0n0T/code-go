package main

import "fmt"

// 别名
type myint int

// 结构体
type book struct {
	title string
	auth  string
}

func main() {
	var book1 book
	book1.title = "golang"
	book1.auth = "zhang3"

	fmt.Printf("%v\n", book1)
}
