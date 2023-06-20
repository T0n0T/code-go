/*
Copyright © 2023 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	"log"
	"net"
	"os"
	"strconv"
	"strings"
	"time"

	"github.com/spf13/cobra"
)

var (
	number    *int
	duration  *string
	chat_flag *bool
)

// connCmd represents the conn command
var connCmd = &cobra.Command{
	Use:   "conn",
	Short: "使用来自config.yaml的AT命令进行连接测试",

	Run: func(cmd *cobra.Command, args []string) {
		var (
			tmp                      = ""
			success_time             = 0
			success_duration float64 = 0
		)
		dead, err := time.ParseDuration(*duration)
		cobra.CheckErr(err)

		sendch <- C.Command.Connect.Reset
		<-recvch
	LoopReset:
		for {
			select {
			case tmp = <-recvch:
				fmt.Fprintf(os.Stdout, "%s", tmp)
			case <-time.After(2 * time.Second):
				fmt.Fprintf(os.Stderr, "wapi模块配置复位完成\r\n")
				break LoopReset
			}
		}

		fmt.Fprintf(os.Stdout, "配置wapi连接\n")
		st := time.Now()
		for _, cmd := range C.Command.Connect.Config {
			tmp = ""
			select {
			case sendch <- cmd:
				tmp = <-recvch
			case <-time.After(dead):
				fmt.Fprintf(os.Stderr, "wapi模块连接配置超时: %s\n", cmd)
			}
			fmt.Fprintf(os.Stdout, "%s", tmp)
			if !strings.Contains(tmp, "OK") {
				fmt.Fprintf(os.Stderr, "wapi模块连接配置失败: cmd: %s msg: %s", cmd, tmp)
				os.Exit(1)
			}
		}

		fmt.Fprintf(os.Stdout, "wapi连接配置结束,使用了 %v 秒\n", time.Since(st).Seconds())

		for i := 0; i < *number; i++ {
			tmp = ""
			t := time.Now()
			select {
			case sendch <- C.Command.Connect.Link:
				if *chat_flag {
					Chat(dead)
				}
			case <-time.After(dead):
				fmt.Fprintf(os.Stderr, "wapi模块超时: %s\n", C.Command.Connect.Link)
			}

		Loop:
			for {
				select {
				case tmp = <-recvch:
					fmt.Fprintf(os.Stdout, "%s", tmp)
					if strings.Contains(tmp, C.WLAN) {
						cost := time.Since(t)
						success_time++
						success_duration += cost.Seconds()
						fmt.Fprintf(os.Stdout, "第 %d 次成功连接\n", success_time)
					}
				case <-time.After(5 * time.Second):
					break Loop
				}
			}

			sendch <- C.Command.Connect.UnLink
			<-recvch
			fmt.Fprintf(os.Stdout, "断开第%d次测试连接\n", i+1)
			fmt.Fprintf(os.Stdout, "-----------------------------------------------------------------------------\n")
			time.Sleep(2 * time.Second)
		}
		if success_time != 0 && *number != 0 {
			fmt.Fprintf(os.Stdout, `=============================================================================
测试次数	|	连接成功率%%	|	成功连接平均耗时/s
%d		|	%v		|	%v\n
=============================================================================`,
				*number, float64(success_time)/float64(*number)*100, success_duration/float64(success_time))
		} else {
			fmt.Fprintln(os.Stderr, "没有成功的连接")
		}

	},
}

func init() {
	rootCmd.AddCommand(connCmd)
	number = connCmd.Flags().IntP("number", "n", 5, "测试的次数")
	duration = connCmd.Flags().StringP("duration", "d", "5s", "单次测试最大时间")
	chat_flag = connCmd.Flags().BoolP("chat", "c", false, "启用socket通信测试")
}

func Chat(d time.Duration) {
	TCPUP()
	fmt.Fprintf(os.Stdout, "测试socket通信\n")
	var (
		tmp        string
		err        error
		socket_num int
	)
	sendch <- C.Control.LinkSocket
	if tmp = recv(1 * time.Second); strings.Contains(tmp, "OK") {
		off := strings.Index(tmp, "OK")
		socket_num, err = strconv.Atoi(tmp[off+1:])
		if err != nil {
			fmt.Fprintf(os.Stderr, "socket获取失败\n")
		}
	} else {
		fmt.Fprintf(os.Stderr, "socket获取失败\n")
		sendch <- C.Control.UnLinkSocket
		recv(d)
		return
	}
	sendch <- fmt.Sprintf("%s%d,%d", C.Control.Send, socket_num, len(C.Control.Msg))
	if strings.Contains(recv(200*time.Millisecond), "OK") {
		sendch <- C.Control.Msg
		sendch <- C.Control.Recv
		if tmp = recv(1 * time.Second); strings.Contains(tmp, "OK") {
			fmt.Fprintf(os.Stdout, "%s\n", tmp)
		} else {
			fmt.Fprintf(os.Stderr, "socket接收失败\n", C.Control.Msg)
			sendch <- C.Control.UnLinkSocket
			recv(d)
			return
		}
	} else {
		fmt.Fprintf(os.Stderr, "socket发送启动失败\n")
		sendch <- C.Control.UnLinkSocket
		recv(d)
		return
	}
	fmt.Fprintf(os.Stdout, "结束socket通信测试\n")
}

func recv(d time.Duration) string {
	var str = ""
Loop:
	for {
		select {
		case tmp := <-recvch:
			str += tmp
			fmt.Fprintf(os.Stdout, "%s", tmp)
		case <-time.After(d):
			fmt.Fprintf(os.Stderr, "接受字符串超时\r\n")
			break Loop
		}
	}
	return str
}

func TCPUP() {
	// 启动服务器
	listener, err := net.Listen("tcp", ":1234")
	if err != nil {
		log.Println("Failed to start server:", err)
		return
	}

	// 循环接受客户端连接
	conn, err := listener.Accept()
	if err != nil {
		log.Println("Failed to accept connection:", err)
		return
	}

	go handleConnection(conn) // 启动一个 goroutine 处理连接
}

// 处理连接
func handleConnection(conn net.Conn) {
	defer conn.Close()

	// 读取客户端发送的数据
	buffer := make([]byte, 1024)
	n, err := conn.Read(buffer)
	if err != nil {
		log.Println("Failed to read data:", err)
		return
	}

	// 回传收到的数据给客户端
	_, err = conn.Write(buffer[:n])
	if err != nil {
		log.Println("Failed to write data:", err)
		return
	}
}
