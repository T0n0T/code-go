package main

import "fmt"

type Reader interface {
	ReadBook()
}

type Writer interface {
	WriteBook()
}

type Book struct{}

func (a *Book) ReadBook() {
	fmt.Println("read a book")
}

func (a *Book) WriteBook() {
	fmt.Println("write a book")
}

func main() {
	//b: pair<type:Book, value:book{}地址>
	b := &Book{}

	//r: pair<type:, value:>
	var r Reader
	//r: pair<type:Book, value:book{}地址>
	r = b
	r.ReadBook()

	var w Writer
	//r: pair<type:Book, value:book{}地址>
	//r.(writer)将r断言为writer
	w = r.(Writer)

	w.WriteBook()
}
