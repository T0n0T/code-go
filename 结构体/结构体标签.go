package main

import (
	"fmt"
	"reflect"
)

type resume struct {
	Name string `info:"name"`
	Sex  string `info:"sex"`
}

func findTag(str interface{}) {
	t := reflect.TypeOf(str).Elem()

	for i := 0; i < t.NumField(); i++ {
		tagstring := t.Field(i).Tag.Get("info")
		fmt.Println("info:", tagstring)
	}

}

func main() {
	var re resume
	findTag(re)
}
