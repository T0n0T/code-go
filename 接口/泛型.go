package main

import "fmt"

func main() {
	str := []string{"ssss", "hello"}
	printfstring(str)
}

// T泛型,预定义类型都可以传入
func printfstring[T string | int](a []T) {
	for _, a := range a {
		fmt.Println(a)
	}
}
