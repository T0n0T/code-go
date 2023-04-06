package main

import "fmt"

// 结构体
// 类的大写的是共有(跨包可用)
// 类的小写的是私有(包内使用)
// 包括了函数
type Hero struct {
	Name  string
	Ad    int
	level int
}

// 封装了方法
func (a Hero) showInfo() {
	fmt.Println("Name:\t ", a.Name)
	fmt.Println("Ad:\t ", a.Ad)
	fmt.Println("Level:\t ", a.level)
}

func (a Hero) GetName() string {
	return a.Name
}

func (a Hero) SetName(newName string) {
	//这里只进行了值传递,是一份拷贝
	a.Name = newName
}

// -----------------------------------------
func (a *Hero) SetName2(newName string) {
	//这里只进行了引用传递,是同一份数据
	a.Name = newName
}

func main() {

	hero := Hero{"zhang3", 100, 1}
	// var hero Hero
	// hero.Name = "zhang3"
	// hero.Ad = 100
	// hero.level = 1

	hero.showInfo()

	hero.SetName2("li4")
	hero.showInfo()
}
