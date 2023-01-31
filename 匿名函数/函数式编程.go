package main

import "fmt"

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
