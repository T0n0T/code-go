package main

import (
	"fmt"
)

func main() {
	test1() //输出：this is test 1
	test2() //输出：this is test 2  test 2 is  panic
	test3() //输出：this is test 3
}

func test1() {
	fmt.Println("this is test 1")
}

func test2() {
	defer func() {
		if err := recover(); err != nil {
			fmt.Println(err)
		}
	}()
	fmt.Println("this is test 2")
	panic("test 2 is panic")
}

func test3() {
	fmt.Println("this is test 3")
}
