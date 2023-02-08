package main

import (
	"fmt"
)

// slice,map,channel都是引用类型
// 说明切片作为引用类型,传递的是内存空间中的值,同c语言的数组名称的含义
func main() {
	// slice := []string{"妞妞", "奈奈", "发发", "戴戴"}
	slice := []string{"nainia"}
	fmt.Println("修改前:", slice)
	fmt.Printf("函数外1:%p\n", slice)
	update(slice)
	fmt.Println("修改后:", slice)

	fmt.Println("------------------------")

	fmt.Println("修改前:", slice)
	fmt.Printf("函数外2:%p\n", slice)
	update(slice)
	fmt.Println("修改后:", slice)
}

// func update(obj []string) {
// 	fmt.Println("------------------------")
// 	// fmt.Printf("函数内1:%p\n", obj)
// 	v := reflect.ValueOf(obj)
// 	v.SetString("222")
// 	fmt.Printf("函数内2:%p\n", obj)
// 	fmt.Println("------------------------")
// }

// 接口变量中存储的具体值是不可寻址,故直接传入接口后,原始副本不会因为接口指针指向的值改变而改变
func update(obj any) {
	fmt.Printf("函数内1:%p\n", obj)
	obj.([]string)[0] = "nn"
	fmt.Println(obj)
	fmt.Printf("函数内2:%p\n", obj)
}

// func update(obj any) {
// 	// v := reflect.ValueOf(obj).Elem()
// 	fmt.Printf("函数内1:%v\n", &obj)
// 	obj = append(obj.([]string), "nbi")
// 	fmt.Println(obj)
// 	fmt.Printf("函数内2:%p\n", obj)
// }
