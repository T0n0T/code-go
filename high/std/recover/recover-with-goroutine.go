package main

import (
	"fmt"
)

func main() {

	defer func() {
		if err := recover(); err != nil {
			fmt.Println(err)
		}
	}()

	test1()
	go test2()
	test3()
	for {
		select {}
	}
}

func test1() {
	fmt.Println("this is test 1")
}

func test2() {
	fmt.Println("this is test 2")
	panic("test 2 is panic")
}

func test3() {
	fmt.Println("this is test 3")
}
