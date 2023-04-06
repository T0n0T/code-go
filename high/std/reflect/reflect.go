package main

import (
	"fmt"

	"gopl.io/ch12/display"
	"gopl.io/ch7/eval"
)

func main() {
	e, _ := eval.Parse("sqrt(A / pi)")
	fmt.Println(e)
	display.Display("e", e)
}
