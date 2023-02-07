package main

import "fmt"

// slice,map,channel都是引用类型
// 说明切片作为引用类型,传递的是内存空间中的值,同c语言的数组名称的含义
func main() {
	slice := []string{"妞妞", "奈奈", "发发", "戴戴"}
	fmt.Println(slice)
	update(slice)
	fmt.Println("修改后:", slice)
}

func update(slice []string) {
	slice[0] = "傻傻"
}
