/*
Copyright © 2023 T0n0T [823478402@qq.com]
*/
package cmd

import (
	"fmt"
	"log"
	"os"
	"os/signal"
	"time"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"github.com/tarm/serial"
	"wapi.test/global"
)

var (
	cfgFile     string
	sendch      chan []byte
	recvch      chan []byte
	EvalDeclare string
	Config      *global.Config
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
		// Find home directory.
		pwd, err := os.Getwd()
		cobra.CheckErr(err)

		// Search config in home directory with name ".wapi.test" (without extension).
		viper.AddConfigPath(pwd)
		viper.SetConfigType("yaml")
		viper.SetConfigName("config")
	}

	viper.AutomaticEnv() // read in environment variables that match

	// If a config file is found, read it in.
	if err := viper.ReadInConfig(); err == nil {
		fmt.Fprintln(os.Stderr, "Using config file:", viper.ConfigFileUsed())
	} else if err != nil {
		panic(fmt.Errorf("fatal error config file: %w", err))
	}
	if err := viper.Unmarshal(Config); err != nil {
		fmt.Println(err)
	}
}

func openport() {
	mode := serial.Config{
		Name:     Config.UartName,
		Baud:     Config.Baud,
		StopBits: serial.StopBits(Config.StopBits),
		Parity:   serial.Parity(Config.Parity),
	}
	tty, err := serial.OpenPort(&mode)
	if err != nil {
		log.Fatal(err)
		return
	}

	sendch = make(chan []byte, 10)
	recvch = make(chan []byte, 10)
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
				_, err := tty.Write(data)
				if err != nil {
					log.Fatal(err)
				}
			default:
				time.Sleep(1 * time.Second)
			}
		}

	}()

	go func() {
		buff := make([]byte, 100)
		for {
			n, err := tty.Read(buff)
			if err != nil {
				log.Fatal(err)
			}
			if n == 0 {
				fmt.Println("\nEOF")
				continue
			}
			recvch <- buff[:n]
		}
	}()
}
