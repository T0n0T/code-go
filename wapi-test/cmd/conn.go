/*
Copyright © 2023 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
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
			n            = 10
			success_time = 0
		)
		dead, err := time.ParseDuration(*duration)
		cobra.CheckErr(err)
		if number != nil {
			n = *number
		}
		for i := 0; i < n; i++ {
			for _, cmd := range C.Command.Connect {
				timeout := time.NewTimer(dead)
				select {
				case sendch <- cmd:
				case <-timeout.C:
					continue
				}
				if strings.Index(<-recvch, "OK") != -1 {
					success_time++
				}
			}

		}
	},
}

func init() {
	runCmd.AddCommand(connCmd)
	number = connCmd.Flags().CountP("number", "n", "测试的次数")
	duration = connCmd.Flags().StringP("duration", "d", "5s", "单次测试最大时间")
}
