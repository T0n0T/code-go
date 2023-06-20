/*
Copyright © 2023 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	"os"
	"time"

	"github.com/spf13/cobra"
)

var (
	wlanflag *bool
	uartflag *bool
)

// checkCmd represents the check command
var checkCmd = &cobra.Command{
	Use:   "check",
	Short: "查看当前模块设置",
	Run: func(cmd *cobra.Command, args []string) {
		var tmp string
		if *wlanflag {
			sendch <- C.Command.Check.CheckWlan
		WLAN:
			for {
				select {
				case tmp = <-recvch:
					fmt.Fprintf(os.Stdout, "%s", tmp)
				case <-time.After(2 * time.Second):
					break WLAN
				}
			}
			close(recvch)
			os.Exit(0)
		}
		if *uartflag {
			sendch <- C.Command.Check.CheckUart
		UART:
			for {
				select {
				case tmp = <-recvch:
					fmt.Fprintf(os.Stdout, "%s", tmp)
				case <-time.After(2 * time.Second):
					break UART
				}
			}
			close(recvch)
			os.Exit(0)
		}
		fmt.Fprintln(os.Stderr, "undefine command.")
	},
}

func init() {
	rootCmd.AddCommand(checkCmd)

	// Here you will define your flags and configuration settings.
	wlanflag = checkCmd.Flags().BoolP("wlan", "w", false, "查看wapi模块的wlan设置情况")
	uartflag = checkCmd.Flags().BoolP("uart", "u", false, "查看wapi模块的uart设置情况")
}
