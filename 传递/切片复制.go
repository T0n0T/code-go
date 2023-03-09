package main

import "fmt"

func main() {
	array := [8]uint8{}
	// s := []byte{1, 2, 3, 4, 5, 6, 7, 8, 9}
	s := []byte{1, 2}

	fmt.Println(array)
	copy(array[:], s)
	fmt.Println(array)
}
