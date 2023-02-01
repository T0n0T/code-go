package main

import (
	"fmt"
)

// channel是go语言中协程的通信方式,可以用来对一些需要关闭的协程操,类似于IPC
// make(chan Type)
// make(chan Type, capacity)有缓存还是无缓冲
// channe <- value 写
// <- channel	读
// x := <- channel  读入到
// x, ok := <- channel  读入到,并检查是否为空
func main() {
	//定义一个channel
	c := make(chan int)

	go func() {
		defer fmt.Println("goroutine结束")

		fmt.Println("goroutine开始")
		c <- 666
	}()
	num := <-c

	fmt.Println("num = ", num)
	fmt.Println("main goroutine结束")
}
