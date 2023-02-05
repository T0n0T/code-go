package main

import (
	"fmt"
)

// 闭包是一种值引用,会保留副本,
// 内层函数调用 外层函数 的 局部变量,相当于同一份工作增加了多个工作空间
func main() {
	r1 := increment()
	fmt.Printf("%p\n", r1)

	v1 := r1()
	fmt.Println(v1)

	v2 := r1()
	fmt.Println(v2)
	fmt.Println(r1())
	fmt.Println(r1())
	fmt.Println(r1())
	fmt.Println(r1())

	r2 := increment()
	v3 := r2()
	fmt.Println(v3)

}

func increment() func() int {
	i := 0
	fun := func() int {
		i++
		return i
	}
	return fun
}
