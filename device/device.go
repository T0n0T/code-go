package main

import (
	"fmt"
	"sync"
	"test/device/gpio"
	"time"
)

var wg sync.WaitGroup

// Bee_PA8 蜂鸣器
func Bee_PA8() {

	for i := 0; i < 6; i++ {
		gpio.WriteGpioValue("PA8", 1)
		time.Sleep(time.Millisecond * 500)
		gpio.WriteGpioValue("PA8", 0)
		time.Sleep(time.Millisecond * 500)
	}

	wg.Done()
}

// LED_PC13 绿色指示灯
func LED_PC13() {
	for {
		gpio.WriteGpioValue("PC13", 1)
		time.Sleep(time.Millisecond * 500)
		gpio.WriteGpioValue("PC13", 0)
		time.Sleep(time.Millisecond * 500)
	}
	//wg.Done()
}

// LED_PC13 红色指示灯
func LED_PC14() {
	for {
		gpio.WriteGpioValue("PC14", 1)
		time.Sleep(time.Millisecond * 1000)
		gpio.WriteGpioValue("PC14", 0)
		time.Sleep(time.Millisecond * 1000)
	}
	//wg.Done()
}

func main() {

	gpio.GpioMapInit() //初始化IO映射表

	gpio.InitGpio("PA8")
	gpio.SetGpioDirection("PA8", "out")

	gpio.InitGpio("PC13")
	gpio.SetGpioDirection("PC13", "out")

	gpio.InitGpio("PC14")
	gpio.SetGpioDirection("PC14", "out")

	wg.Add(1)
	Bee_PA8()

	wg.Add(1)
	go LED_PC13()

	wg.Add(1)
	go LED_PC14()

	wg.Wait()
	fmt.Println("进程退出")

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
