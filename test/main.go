package main

// #include<stdio.h>
// #include<linux/input.h>
// struct input_event create_event()
// {
//     struct input_event event;
//     event.type = SND_BELL;
//     event.value = 1;
//     return event;
// }
import "C"
import "fmt"

func main() {
	a := C.struct_input_event{_type: C.SND_BELL, value: 1}
	fmt.Printf("a:%b\n", a)
	// fmt.Println(a)
	b := C.create_event()
	fmt.Printf("b:%b\n", b)
	fmt.Println(b)
}
