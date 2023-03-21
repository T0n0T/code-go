package main

import "C"

func main() {}

//export test
type test struct {
	a C.int
}

//export number_add_mod
func number_add_mod(a, b, mod C.int) C.int {
	return (a + b) % mod
}
