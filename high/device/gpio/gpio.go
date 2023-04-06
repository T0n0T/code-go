package gpio

import (
	"fmt"
	"os"
	"strconv"
)

// GpioMapSlice 定义一个切片map表
var GpioMapSlice = make([]map[byte]byte, 9)

// GpioMapInit 初始化GPIO编号和驱动编号的对应表。
// PA15:A对应0，PA15的驱动编号计算方式、：0*32+15
func GpioMapInit() {
	for index, _ := range GpioMapSlice {
		GpioMapSlice[index] = make(map[byte]byte, 1)
		GpioMapSlice[index][byte(index)+65] = byte(index)
	}

	// for index, value := range GpioMapSlice {
	//         fmt.Printf("index:%d value:%v\n", index, value)
	// for K2, value := range GpioMapSlice[index] {
	//         // if K2 == 'G' {
	//         fmt.Printf("K2:%c value:%v\n", K2, value)
	//         // }
	//}
	// }
}

// FindPinNum 查表计算驱动编号
func FindPinNum(p byte, a int) (Driver_number int) {
	for index, _ := range GpioMapSlice {
		//fmt.Printf("index:%d value:%v\n", index, value)
		for K2, value := range GpioMapSlice[index] {
			if K2 == p {
				//fmt.Printf("K2:%c value:%v\n", K2, value)
				Driver_number = int(value)*32 + a
				return Driver_number
			}
		}
	}
	return -1
}

// GpioGetGpioNumber 检查输入的GPIO号是否正确
func GpioGetDriverNumber(Port_Name string) (Driver_number int) {
	//fmt.Println(Port_Name)
	Driver_number = -1
	var Slice = make([]byte, 4, 8)
	Slice = []byte(Port_Name)
	if Slice[0] == 'P' {
		if Slice[1] >= 'A' && Slice[1] <= 'I' {
			var a, _ = strconv.Atoi(string(Slice[2:]))
			if a >= 0 && a <= 31 {
				Driver_number = FindPinNum(Slice[1], a)
				return Driver_number
			} else {
				Driver_number = -1
				fmt.Println("Port_Name错误-1")
			}
		} else {
			fmt.Println("Port_Name错误-2")
			Driver_number = -2
		}
	} else {
		fmt.Println("Port_Name错误-3")
		Driver_number = -3
	}
	return Driver_number
}

// InitGpio 生成Linux系统里面的gpio文件
func InitGpio(Port_Name string) {

	num := GpioGetDriverNumber(Port_Name)
	file, err := os.OpenFile("/sys/class/gpio/export", os.O_WRONLY, 0666)
	if err != nil {
		fmt.Println("open file failed, err:", err)
		return
	}
	defer file.Close()
	var str = fmt.Sprintf("%d", num)
	//fmt.Println(str)
	file.WriteString(str)
}

// SetGpioDirection 设置GPIO方向，in：输入，out：输出
func SetGpioDirection(Port_Name string, Direction string) {
	num := GpioGetDriverNumber(Port_Name)
	var strs = fmt.Sprintf("/sys/class/gpio/gpio%d/direction", num)
	file, err := os.OpenFile(strs, os.O_RDWR, 0666)
	if err != nil {
		fmt.Println("open file failed, err:", err)
		return
	}
	defer file.Close()
	file.WriteString(Direction)
}

// WriteGpioValue 设置GPIO输出高低电平，1：高电平，0：低电平
func WriteGpioValue(Port_Name string, value byte) {
	num := GpioGetDriverNumber(Port_Name)
	var strs = fmt.Sprintf("/sys/class/gpio/gpio%d/value", num)
	file, err := os.OpenFile(strs, os.O_RDWR, 0666)
	if err != nil {
		fmt.Println("open file failed, err:", err)
		return
	}
	defer file.Close()
	var str = fmt.Sprintf("%d", value)
	//fmt.Println(str)
	file.WriteString(str)
}
