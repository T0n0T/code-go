package main

import "fmt"

// 说明直接对传入函数的数组值,修改只是对其引用进行修改
func main() {
	arr := [4]int{1, 2, 3, 4}
	fmt.Println(arr)
	update(arr)
	fmt.Println("修改后:", arr)
}

func update(arr [4]int) {
	arr[0] = 100
}
