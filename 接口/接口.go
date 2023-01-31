package main

import "fmt"

func main() {
	str := []string{"ssss", "hello"}
	printfstring(str)
}

// 传入空接口,使用类型断言转换数据
func printfstring(a interface{}) {
	for _, a = range a.([]string) {
		fmt.Println(a)
	}
}
