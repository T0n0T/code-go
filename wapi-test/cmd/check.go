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
		if *wlanflag {
			sendch <- C.Command.Check.CheckWlan
			time.Sleep(1 * time.Second)
			str := <-recvch
			fmt.Printf("%s\n", str)
			// close(recvch)
			os.Exit(0)
		}
		if *uartflag {
			sendch <- C.Command.Check.CheckUart
			fmt.Println(<-recvch)
			str := <-recvch
			fmt.Printf("%s\n", str)
			close(recvch)
			os.Exit(0)
		}
	},
}

func init() {
	rootCmd.AddCommand(checkCmd)

	// Here you will define your flags and configuration settings.
	wlanflag = checkCmd.Flags().BoolP("wlan", "w", false, "check wapi module wlan setting")
	uartflag = checkCmd.Flags().BoolP("uart", "u", false, "check wapi module uart setting")
}
