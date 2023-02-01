package main

import (
	"fmt"
	"reflect"
)

type User struct {
	Id   int
	Name string
	Age  int
}

// 注意Call的大写,type属于标准库-反射中的方法,调用不到main包中的私有方法
func (a User) Call() {
	fmt.Println("calling user...")
	fmt.Printf("%v\n", a)
}

func main() {
	// var num float64 = 1.2345
	// ReflectNum(num)
	a := User{1, "zhang3", 18}

	ReflectUser(a)
}

func ReflectUser(arg interface{}) {
	argType := reflect.TypeOf(arg)
	// fmt.Println("arg type: ", argType)

	argValue := reflect.ValueOf(arg)
	// fmt.Println("arg type: ", argValue)

	//通过type获取字段field
	for i := 0; i < argType.NumField(); i++ {
		field := argType.Field(i)
		value := argValue.Field(i).Interface() //value使用了interface来存储具体值

		fmt.Printf("%s: %v = %v\n", field.Name, field.Type, value)
	}

	//通过type调用方法method
	for i := 0; i < argType.NumMethod(); i++ {
		m := argType.Method(i)

		fmt.Printf("%s: %v\n", m.Name, m.Type)
	}

}

func ReflectNum(arg interface{}) {
	fmt.Println("type:  ", reflect.TypeOf(arg))
	fmt.Println("value: ", reflect.ValueOf(arg))
}
