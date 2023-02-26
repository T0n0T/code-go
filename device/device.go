package main

import (
	"fmt"
	"os"
	"syscall"
)

func main() {
	syscall.SYS_EVENTFD
	os.OpenFile("/dev/input/event0", os.O_RDWR, 0)
	fd, _ := syscall.Open("/dev/input/event0", syscall.O_RDWR, 0)
	syscall.Write()
	pid, _, _ := syscall.Syscall(39, 0, 0, 0) // 用不到的就补上 0
	fmt.Println("Process id: ", pid)
}

// func main() {
// 	for _, url := range os.Args[1:] {
// 		resp, err := http.Get(url)
// 		if err != nil {
// 			fmt.Fprintf(os.Stderr, "fetch: %v\n", err)
// 			os.Exit(1)
// 		}
// 		b, err := ioutil.ReadAll(resp.Body)
// 		resp.Body.Close()
// 		if err != nil {
// 			fmt.Fprintf(os.Stderr, "fetch: reading %s: %v\n", url, err)
// 			os.Exit(1)
// 		}
// 		fmt.Printf("%s", b)
// 	}
// }
