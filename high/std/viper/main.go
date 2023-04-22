package main

import (
	"github.com/fsnotify/fsnotify"
	"github.com/mitchellh/mapstructure"
	"github.com/spf13/viper"
)

type NetConfig struct {
	DevName string
	Msg     DeviceMsg
}

type DeviceMsg struct {
	Address  []string `mapstructure:"addresses" yaml:"addresses"`
	DHCP     string   `mapstructure:"dhcp4" yaml:"dhcp4"`
	Optional bool     `mapstructure:"optional" yaml:"optional"`
}

type NetDev string

var (
	NetplanConfig   []NetConfig //IP地址
	NetplanPath     string      //网卡配置文件地址
	SoftwareVersion string      //软件版本号
	HardwareVersion string      //硬件版本号
)

func main() {
	NetplanParse()
	<-make(chan struct{})
}

func NetplanParse() (err error) {
	if err != nil {
		return
	}
	v := viper.New()

	v.SetConfigFile("./netplan_test.yaml")
	v.SetConfigType("yaml")
	err = v.ReadInConfig()
	if err != nil {
		return
	}

	devices := v.GetStringMap("network.ethernets")
	if devices == nil {
		return
	}
	updateConfig(devices)

	//检查热更改
	v.WatchConfig()
	v.OnConfigChange(func(e fsnotify.Event) {
		devices := v.GetStringMap("network.ethernets")
		if devices != nil {
			updateConfig(devices)
		}
	})

	return
}

func updateConfig(d map[string]interface{}) {
	var ipconfig []NetConfig

	for devname, device := range d {
		var config NetConfig
		mapstructure.Decode(device, &config.Msg)
		config.DevName = devname
		ipconfig = append(ipconfig, config)
	}
	NetplanConfig = ipconfig
}
