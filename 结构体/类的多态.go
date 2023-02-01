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

	animal.Sleep()
}
