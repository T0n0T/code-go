package main

import "fmt"

// slice,map,channel都是引用类型
// 说明切片作为引用类型,传递的是内存空间中的值,同c语言的数组名称的含义
func main() {
	c := oper(1, 2, add)
	fmt.Println(c)
}

func oper(a, b int, fun func(int, int) int) int {
	result := fun(a, b)
	return result
}

func add(a, b int) int {
	return a + b
}
