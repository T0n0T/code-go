package main

import (
	"fmt"

	"github.com/spf13/viper"
)

func main() {
	// 读取要修改的设备名称和IP地址
	deviceName := "lan0"
	ipAddress := "192.168.1.100/24"

	v := viper.New()
	// 设置viper读取的文件路径和文件名
	v.SetConfigFile("./netplan_test.yaml")

	// 读取配置文件
	err := v.ReadInConfig()
	if err != nil {
		fmt.Printf("Failed to read config file: %v\n", err)
		return
	}

	// 修改设备配置
	devices := v.GetStringMap("network.ethernets")
	if devices == nil {
		fmt.Println("No ethernet devices found in config file")
		return
	}
	device := devices[deviceName]
	if device == nil {
		fmt.Printf("Device %s not found in config file\n", deviceName)
		return
	}
	deviceMap := device.(map[string]interface{})
	deviceMap["addresses"] = []string{ipAddress}

	// 保存修改后的配置文件
	err = viper.WriteConfig()
	if err != nil {
		fmt.Printf("Failed to write config file: %v\n", err)
		return
	}

	// v.OnConfigChange(func(e fsnotify.Event) {
	// 	devices = v.GetStringMap("network.ethernets")
	// 	device = devices[deviceName]
	// 	deviceMap = device.(map[string]interface{})
	// 	fmt.Println("lan0.addresser] =", deviceMap["addresses"])
	// })
	fmt.Println("Successfully updated network config.")
}
