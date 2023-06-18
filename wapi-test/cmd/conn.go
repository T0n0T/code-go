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
			n                        = 10
			success_time             = 0
			success_duration float64 = 0
		)
		dead, err := time.ParseDuration(*duration)
		cobra.CheckErr(err)
		if number != nil {
			n = *number
		}
		fmt.Fprintln(os.Stdout, "使用默认的连接测试次数: 10, 可以使用-d指定")
		for i := 0; i < n; i++ {
			t := time.Now()
			for _, cmd := range C.Command.Connect {
				timeout := time.NewTimer(dead)
				select {
				case sendch <- cmd:
				case <-timeout.C:
					continue
				}
				tmp = <-recvch
				if !strings.Contains(tmp, "OK") {
					break
				}
			}
			cost := time.Since(t)
			if strings.Contains(tmp, "mask") {
				success_time++
				success_duration += cost.Seconds()
				sendch <- C.Command.DisConnect
				<-recvch
			}
		}
		fmt.Fprintf(os.Stdout, `=================================================\n
测试次数	|	连接成功率%%	|	成功连接平均耗时/s
	%d     	|		%d     |		 %v 
=================================================\n`,
			n, success_time/n, success_duration/float64(success_time))
	},
}

func init() {
	runCmd.AddCommand(connCmd)
	number = connCmd.Flags().CountP("number", "n", "测试的次数")
	duration = connCmd.Flags().StringP("duration", "d", "5s", "单次测试最大时间")
}
