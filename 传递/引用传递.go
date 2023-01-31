package main

import "fmt"

// slice,map,channel都是引用类型
// 说明切片作为引用类型,传递的是内存空间中的值,同c语言的数组名称的含义
func main() {
	slice := []int{1, 2, 3, 4}
	fmt.Println(slice)
	update(slice)
	fmt.Println("修改后:", slice)
}

func update(slice []int) {
	slice[0] = 100
}
