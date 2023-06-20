/*
Copyright © 2023 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	"os"
	"strings"
	"time"

	"github.com/spf13/cobra"
)

var (
	number   *int
	duration *string
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
	LoopReset:
		for {
			select {
			case tmp = <-recvch:
				fmt.Fprintf(os.Stdout, "%s", tmp)
			case <-time.After(2 * time.Second):
				fmt.Fprintf(os.Stderr, "wapi模块配置复位完成\n")
				break LoopReset
			}
		}

		fmt.Fprintf(os.Stdout, "配置wapi连接\n")
		timeout := time.NewTimer(dead)
		st := time.Now()
		for _, cmd := range C.Command.Connect.Config {
			timeout.Reset(dead)
			tmp = ""
			fmt.Fprintln(os.Stdout, cmd)
			select {
			case sendch <- cmd:
				tmp = <-recvch
			case <-timeout.C:
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
			timeout.Reset(dead)
			t := time.Now()
			select {
			case sendch <- C.Command.Connect.Link:
				fmt.Fprintf(os.Stdout, "%s\n", C.Command.Connect.Link)
			case <-timeout.C:
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
				case <-time.After(2 * time.Second):
					break Loop
				}
			}

			sendch <- C.Command.Connect.UnLink
			<-recvch
			fmt.Fprintf(os.Stdout, "断开第%d次测试连接\n", i+1)
			fmt.Fprintf(os.Stdout, "=============================================================================\n")
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
	runCmd.AddCommand(connCmd)
	number = connCmd.Flags().IntP("number", "n", 5, "测试的次数")
	duration = connCmd.Flags().StringP("duration", "d", "10s", "单次测试最大时间")
}
