/*
Copyright © 2023 T0n0T [823478402@qq.com]
*/
package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"github.com/tarm/serial"
	"wapi.test/global"
	com "wapi.test/uart"
)

var (
	cfgFile string
	sendch  chan string
	recvch  chan string
	C       global.Config
)

// rootCmd represents the base command when called without any subcommands
var rootCmd = &cobra.Command{
	Use:   "wapi.test",
	Short: "用于WAPI AT模式测试",
	Long: `进行测试时间内,以一定时间间隔连接,断开的接入成功率测试,
进行测试时间内,发收错误率测试`,
	// Uncomment the following line if your bare application
	// has an action associated with it:
	// Run: func(cmd *cobra.Command, args []string) { },
}

// Execute adds all child commands to the root command and sets flags appropriately.
// This is called by main.main(). It only needs to happen once to the rootCmd.
func Execute() {
	err := rootCmd.Execute()
	if err != nil {
		os.Exit(1)
	}
}

func init() {
	cobra.OnInitialize(initConfig)

	// Here you will define your flags and configuration settings.
	// Cobra supports persistent flags, which, if defined here,
	// will be global for your application.

	rootCmd.PersistentFlags().StringVar(&cfgFile, "config", "", "config file (default is ./config.yaml)")

	// Cobra also supports local flags, which will only run
	// when this action is called directly.
	// rootCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}

// initConfig reads in config file and ENV variables if set.
func initConfig() {
	if cfgFile != "" {
		// Use config file from the flag.
		viper.SetConfigFile(cfgFile)
	} else {
		// Search config in home directory with name ".wapi.test" (without extension).
		viper.SetConfigType("toml")
		viper.SetConfigFile("config.toml")
	}

	viper.AutomaticEnv() // read in environment variables that match

	// If a config file is found, read it in.
	if err := viper.ReadInConfig(); err == nil {
		fmt.Fprintln(os.Stderr, "Using config file:", viper.ConfigFileUsed())
	} else if err != nil {
		panic(fmt.Errorf("fatal error config file: %w", err))
	}

	if err := viper.Unmarshal(&C); err != nil {
		fmt.Fprintln(os.Stderr, err)
	}
	fmt.Println(C)
	openport()
}

func openport() {
	uart := &serial.Config{
		Name:     C.UART.Name,
		Baud:     C.UART.Baud,
		StopBits: serial.StopBits(C.UART.StopBits),
		Parity:   serial.Parity(C.UART.Parity),
	}

	sendch = make(chan string, 1)
	recvch = make(chan string, 1)

	err := com.Open(uart)
	cobra.CheckErr(err)
	go com.Exit()
	go com.Send(sendch)
	go com.Recv(sendch)
}
