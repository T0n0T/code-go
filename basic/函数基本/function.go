package main

import "fmt"

func main() {
	// print1()
	// print2("haha")
	a, b := print4(2, 3)
	fmt.Println("a = ", a)
	fmt.Println("b = ", b)
}

// 无参无返回
func print1() {
	fmt.Println("ha")
}

// 有一个参数,无返回
func print2(msg string) {
	fmt.Println(msg)
}

// 有一个参数,无返回
func print3(a, b int) {
	fmt.Println(a + b)
}

// 有一个参数,多个返回值
func print4(a, b int) (int, int) {
	fmt.Println("a = ", a)
	fmt.Println("b = ", b)
	c := a
	a = b
	b = c
	return a, b
}
