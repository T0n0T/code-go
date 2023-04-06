package cbeep

/*
#include <linux/input.h>
*/
import "C"
import (
	"fmt"
	"os"
	"utils"
)

func BeepAct(action uint32) {
	file, err := os.OpenFile("/dev/input/event0", os.O_RDWR, 0777)
	if err != nil {
		fmt.Println("open file failed, err:", err)
		return
	}
	defer file.Close()

	event := C.struct_input_event{_type: C.EV_SND}
	if action == 0 {
		event.code = C.SND_BELL
		event.value = 1000
		data, _ := utils.StructToBin(event)
		file.Write(data)
	} else if action == 1 {
		event.code = C.SND_BELL
		event.value = 0
		data, _ := utils.StructToBin(event)
		file.Write(data)
	}

}
