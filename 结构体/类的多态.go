package main

import "fmt"

// 本质是个指针
type AnimalIF interface {
	Sleep()
	GetColor() string
	GetType() string
}

// 一个具体的类,继承上面的指针
type Cat struct {
	color string
}

func (a *Cat) Sleep() {
	fmt.Println("Cat sleep...")
}

func (a *Cat) GetColor() string {
	return a.color
}

func (a *Cat) GetType() string {
	return "Cat"
}

// 一个具体的类,继承上面的指针
type Dog struct {
	color string
}

func (a *Dog) Sleep() {
	fmt.Println("Dog sleep...")
}

func (a *Dog) GetColor() string {
	return a.color
}

func (a *Dog) GetType() string {
	return "Dog"
}

func main() {
	var animal AnimalIF
	animal = &Cat{"Red"}

	// var a *Cat = new(Cat)
	// a.Sleep()
	animal.Sleep()
}

// type test interface {
// 	Error() string
// }

// // 定义一个 DivideError 结构
// type DivideError struct {
// 	dividee int
// 	divider int
// }

// // 实现 `error` 接口
// func (de *DivideError) Error() string {
// 	strFormat := `
//     Cannot proceed, the divider is zero.
//     dividee: %d
//     divider: 0
// `
// 	return fmt.Sprintf(strFormat, de.dividee)
// }

// // 定义 `int` 类型除法运算的函数
// func Divide(varDividee int, varDivider int) (result int, errorMsg string) {
// 	if varDivider == 0 {
// 		// dData := DivideError{
// 		// 	dividee: varDividee,
// 		// 	divider: varDivider,
// 		// }
// 		var dData test
// 		dData = &DivideError{
// 			dividee: varDividee,
// 			divider: varDivider,
// 		}
// 		errorMsg = dData.Error()
// 		return
// 	} else {
// 		return varDividee / varDivider, ""
// 	}

// }

// func main() {

// 	// 正常情况
// 	if result, errorMsg := Divide(100, 10); errorMsg == "" {
// 		fmt.Println("100/10 = ", result)
// 	}
// 	// 当除数为零的时候会返回错误信息
// 	if _, errorMsg := Divide(100, 0); errorMsg != "" {
// 		fmt.Println("errorMsg is: ", errorMsg)
// 	}

// }
