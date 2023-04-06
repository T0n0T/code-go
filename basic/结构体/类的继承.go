package main

import "fmt"

type Human struct {
	name string
	sex  string
}

// --------------------------
func (a *Human) Eat() {
	fmt.Println("Human eating...")
}

func (a *Human) Walk() {
	fmt.Println("Human walking...")
}

type Superman struct {
	Human //表示继承
	leve  int
}

// 继承的类可以重定义父类方法
func (a *Superman) Eat() {
	fmt.Println("superman eating...")
}

// 继承的类可以定义新的子类方法
func (a *Superman) Fly() {
	fmt.Println("superman flying...")
}

func main() {
	h := Human{"zhang3", "female"}

	h.Eat()
	h.Walk()

	s := Superman{Human{"li4", "female"}, 88}

	s.Walk() //父类方法
	s.Eat()  //子类方法
	s.Fly()  //子类方法
}
