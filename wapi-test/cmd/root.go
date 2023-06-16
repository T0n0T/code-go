/*
Copyright © 2023 T0n0T [823478402@qq.com]
*/
package cmd

import (
	"bytes"
	"fmt"
	"log"
	"os"
	"os/signal"
	"strings"
	"time"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"github.com/tarm/serial"
	"wapi.test/global"
)

var (
	cfgFile     string
	sendch      chan string
	recvch      chan string
	EvalDeclare string
	C           global.Config
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
		viper.SetConfigFile("./config.toml")
	}

	viper.AutomaticEnv() // read in environment variables that match

	// If a config file is found, read it in.
	if err := viper.ReadInConfig(); err == nil {
		fmt.Fprintln(os.Stderr, "Using config file:", viper.ConfigFileUsed())
	} else if err != nil {
		panic(fmt.Errorf("fatal error config file: %w", err))
	}

	if err := viper.Unmarshal(&C); err != nil {
		fmt.Println(err)
	}
	fmt.Println(C)
	openport()
}

func openport() {
	mode := serial.Config{
		Name:     C.UART.Name,
		Baud:     C.UART.Baud,
		StopBits: serial.StopBits(C.UART.StopBits),
		Parity:   serial.Parity(C.UART.Parity),
	}
	tty, err := serial.OpenPort(&mode)
	if err != nil {
		log.Fatal(err)
	}

	sendch = make(chan string, 10)
	recvch = make(chan string, 10)
	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt)

	go func() {
		for _ = range c {
			fmt.Println(EvalDeclare)
			os.Exit(0)
		}
	}()

	go func() {
		for {
			select {
			case data := <-sendch:
				_, err := tty.Write([]byte(fmt.Sprintln(data)))
				if err != nil {
					log.Fatal(err)
				}
				fmt.Println(fmt.Sprintln(data))
			default:
				time.Sleep(1 * time.Second)
			}
		}

	}()

	go func() {
		tmp := make([]byte, 10)
		buf := bytes.NewBuffer(make([]byte, 100))
		for {
			buf.Reset()
			for {
				n, err := tty.Read(tmp)
				if err != nil {
					log.Fatal(err)
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
			recvch <- buf.String()
		}
	}()
}
