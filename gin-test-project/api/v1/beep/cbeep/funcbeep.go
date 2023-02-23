package cbeep

/*
#include "cbeep.h"
*/
import "C"

func BeepOn() {
	C.beep_action(C.uint32_t(0))
}

func BeepOff() {
	C.beep_action(C.uint32_t(1))
}
