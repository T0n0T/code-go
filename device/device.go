package main

import (
	"fmt"
	"log"
	"sync"
	"test/device/gpio"
	"time"

	"go.bug.st/serial"
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

const DEVICE string = "/dev/spidev0.0" /* 设备文件*/

var fd int
var err error

// func main() {
// 	//参数：文件路径，打开方式，打开模式（权限）
// 	fd, err = syscall.Open(DEVICE, syscall.O_RDWR, 0777)
// 	if err != nil {
// 		fmt.Printf("device open failed\r\n")
// 		syscall.Close(fd)
// 		fmt.Println(fd, err)
// 	} else {
// 		speed := 8192000
// 		//参数：文件描述符，命令，数据
// 		err = ioctl.IOCTL(uintptr(fd), spi.SPI_IOC_WR_MAX_SPEED_HZ(), uintptr(unsafe.Pointer(&speed))) /*设置SPI时钟频率*/
// 		if err != nil {
// 			fmt.Printf("can't set spi speed\r\n")
// 			syscall.Close(fd)
// 		} else {
// 			var filedata = make([]byte, 64)
// 			len, _ := syscall.Read(fd, filedata)
// 			if len > 0 {
// 				fmt.Printf("filedata: %v\n", filedata)
// 			}
// 		}
// 	}
// }

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

func main() {
	Dev_mode := serial.Mode{BaudRate: 115200}
	tty, _ := serial.Open("/dev/ttyUSB0", &Dev_mode)

	go func() {
		for {
			n, err := tty.Write([]byte("jianggoujianggoujianggou\n\rsssss11111\n\r"))
			if err != nil {
				log.Fatal(err)
			}
			fmt.Printf("Sent %v bytes\n", n)
		}

	}()

	buff := make([]byte, 100)
	for {
		n, err := tty.Read(buff)
		if err != nil {
			log.Fatal(err)
			break
		}
		if n == 0 {
			fmt.Println("\nEOF")
			break
		}
		fmt.Printf("%v", string(buff[:n]))
	}

}
