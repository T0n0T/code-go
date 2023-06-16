package main

import (
	"fmt"
)

func main() {

	test1()    // 输出：this is test 1
	go test2() //  this is test 2; test 2 is panic
	test3()    //this is test3
	for {      //不推荐这样写 会造成死锁  此处只是单单为了 演示
		select {}
	}
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

//输出结果：
// this is test 1
// this is test 3
// this is test 2
// test is panic
