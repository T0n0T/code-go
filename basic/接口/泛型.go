package main

import "fmt"

func main() {
	str := []string{"ssss", "hello"}
	// str := []interface{}{"ssss", "hello"}
	PrintfInterface(str)

	// PrintReflect()
}

// T泛型,预定义类型都可以传入
func PrintfStringOrInt[T string | int](a []T) {
	for _, a := range a {
		fmt.Println(a)
	}
}

func PrintfAny[T any](a []T) {
	for _, a := range a {
		fmt.Println(a)
	}
}

func PrintfInterface(a interface{}) {
	fmt.Println(a)
	// for _, a := range a {
	// 	fmt.Println(a)
	// }
}

// 反射的做法
// func PrintReflect() {
// 	a := "agaf"
// 	var alltype interface{}
// 	alltype = a
// 	str, _ := alltype.(string)
// 	fmt.Println(str)
// }

// func PrintfInterface[T interface{}](a []T) {
// 	for _, a := range a {
// 		fmt.Println(a)
// 	}
// }
