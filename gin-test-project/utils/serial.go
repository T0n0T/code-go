package utils

import (
	"fmt"
	"io"
	"strings"

	serial "github.com/tarm/serial"
)

const MAXRWLEN = 8000

var buffer []byte
var iorwc io.ReadWriteCloser

func OpenSerial(cfg *serial.Config) (err error) {
	// cfg := &serial.Config{Name: "COM8", Baud: 115200, ReadTimeout: 3 /*毫秒*/}

	iorwc, err = serial.OpenPort(cfg)
	if err != nil {
		fmt.Printf("串口 %s 打开失败", cfg.Name)
		return
	}
	defer iorwc.Close()

	buffer = make([]byte, MAXRWLEN)
	//发命令之前清空缓冲区
	_, err = iorwc.Read(buffer)
	if err != nil {
		fmt.Println("缓冲区读取失败")
		return
	}

	//发命令数据类型为[]byte
	_, err = iorwc.Write([]byte("hello\r\n"))
	if err != nil {
		fmt.Println("缓冲区写入失败")
		return
	}

	return
}

func ReadSerial(ch chan string) {
	var tmpstr string = ""
	for {
		for i := 0; i < 3000; i++ {

			num, _ := iorwc.Read(buffer)
			if num > 0 {
				tmpstr += string(buffer[:num])
			}

			//查找读到信息的结尾标志
			if strings.LastIndex(tmpstr, "\r\nOK\r\n") > 0 {
				break
			}
		}

		//打印输出读到的信息
		fmt.Println(tmpstr)
		ch <- tmpstr
	}
}
