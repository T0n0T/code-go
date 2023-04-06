package main

import "fmt"

// 匿名函数将会自己调用自己
func main() {
	f1()
	f2 := f1
	f2()

	f3 := func() {
		fmt.Println("这里是f3")
	}

	f3()

	func(a, b int) {
		fmt.Printf("a = %d,b = %d\n", a, b)
		fmt.Println("这里是f4")
	}(1, 2)

	a := func(a, b int) int {
		fmt.Println("这里是f5")
		return a + b
	}(3, 4)
	fmt.Println(a)
}

func f1() {
	fmt.Println("这里是f1")
}
