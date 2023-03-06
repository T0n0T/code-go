package ctest

//#include "source.h"
import "C"
import "fmt"

func BeepAction(str string) {
	if str == "on" {
		C.beep_action(1)
	} else if str == "off" {
		C.beep_action(0)
	} else {
		fmt.Println("beep action fail...")
	}
}
