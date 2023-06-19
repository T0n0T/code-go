//go:build windows
// +build windows

package com

import (
	"bytes"
	"fmt"
	"os"
	"os/signal"
	"strings"
	"syscall"
	"time"

	"github.com/spf13/cobra"
	"github.com/tarm/serial"
)

var (
	tty         *serial.Port
	uart_config *serial.Config
	wrong_time  int
)

func Open(uart *serial.Config) (err error) {
	uart_config = uart
	tty, err = serial.OpenPort(uart_config)
	return
}

func Exit() {
	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt)
	<-c
	if wrong_time != 0 {
		fmt.Fprintf(os.Stderr, "测试中串口发生了 %d 次异常退出\n", wrong_time)
	}
	os.Exit(0)
}

func Send(sendch chan string) {
	for {
		select {
		case <-sendch:
			_, err := tty.Write([]byte("fmt.Sprintln(data)\n"))
			if err != nil {
				if err == syscall.ERROR_OPERATION_ABORTED {
					wrong_time++
					fmt.Fprintln(os.Stderr, "串口发送异常, 重新连接串口")
					time.Sleep(2 * time.Second)
					tty, err = serial.OpenPort(uart_config)
					cobra.CheckErr(err)
				}
			}
		default:
			time.Sleep(1 * time.Second)
		}
	}

}

func Recv(recvch chan string) {
	tmp := make([]byte, 10)
	buf := bytes.NewBuffer(make([]byte, 100))
	for {
		buf.Reset()
		for {
			n, err := tty.Read(tmp)
			if err != nil {
				if err == syscall.ERROR_OPERATION_ABORTED {
					wrong_time++
					fmt.Fprintln(os.Stderr, "串口接收异常, 重新连接串口")
					time.Sleep(2 * time.Second)
					tty, err = serial.OpenPort(uart_config)
					cobra.CheckErr(err)
				}
			}
			if n == 0 {
				fmt.Println("\nEOF")
				break
			}
			buf.Write(tmp[:n])
			if strings.LastIndex(buf.String(), "\n") != -1 {
				break
			}
		}
		// fmt.Println("1", buf.String())
		recvch <- buf.String()
		// fmt.Println("2", buf.String())
	}
}
