package cbeep

/*
#include "cbeep.h"
*/
import "C"
import (
	"fmt"
	"os"
)

func BeepOn() {
	C.beep_action(C.uint32_t(0))
}

func BeepOff() {
	C.beep_action(C.uint32_t(1))
}

func BeepAct(action string) {
	file, err := os.OpenFile("/sys/class/leds/beep", os.O_RDWR, 0777)
	if err != nil {
		fmt.Println("open file failed, err:", err)
		return
	}
	defer file.Close()
	file.WriteString(action)
}
