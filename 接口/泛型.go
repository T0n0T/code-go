package main

import "fmt"

func main() {
	str := []string{"ssss", "hello"}
	PrintfInterface(str)
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

// func PrintfInterface(a []interface{}) {
// 	for _, a := range a {
// 		fmt.Println(a)
// 	}
// }

func PrintfInterface[T interface{}](a []T) {
	for _, a := range a {
		fmt.Println(a)
	}
}
