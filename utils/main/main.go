package main

import (
	"fmt"
	"utils"
)

func main() {
	type test struct {
		Age  int
		Name string
	}
	c := test{10, "aaa"}
	fmt.Println(c)
	b, _ := utils.StructToBin(c)
	fmt.Println(b)
}
