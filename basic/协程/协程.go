package main

import (
	"fmt"
	"time"
)

// 协程是线程在用户态的子集,通过协程调度器增加一层,占用cpu中分给用户态的线程,是go高并发的根源
func newtask() {
	i := 0
	for {
		i++
		fmt.Printf("new goroutineL i = %d\n", i)
		time.Sleep(1 * time.Second)
	}
}

// func main() {
// 	go newtask()
// 	i := 0
// 	for {
// 		i++
// 		fmt.Printf("main goroutineL i = %d\n", i)
// 		time.Sleep(1 * time.Second)
// 	}
// }

func main() {
	//使用 go 语句开启一个新的运行期线程
	go func() {
		defer fmt.Println("a,defer")

		func() {
			defer fmt.Println("b,defer")
			fmt.Println("b")
		}()
		fmt.Println("a")
	}()

	for {
		time.Sleep(1 * time.Second)
	}
}
