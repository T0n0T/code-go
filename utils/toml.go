package utils

import (
	"errors"
	"strconv"
	"strings"

	"github.com/spf13/viper"
)

type GatewayConfigData struct {
	// global.GVA_MODEL
	Keepalive        string `json:"keepalive,omitempty" gorm:"comment:keepalive"`              // 保活时间
	LocalGatewayID   string `json:"loraWAN,omitempty" gorm:"comment:LocalGatewayID"`           // loraWAN网关 ID
	LoraWANServiceIP string `json:"remoteServiceIP,omitempty" gorm:"comment:LoraWANServiceIP"` // 远端服务 IP器 IP
	FreqBank         string `json:"freqbank,omitempty" gorm:"comment:Freqbank"`                // 远端服务 频段
	FreqBankConfig   int    `json:"freqbankconfig,omitempty" gorm:"comment:freqbankconfig"`    // 远端服务 频段配置
	Pattern          bool   `json:"pattern,omitempty" gorm:"comment:pattern"`                  // 工作模式，可以选择本地NS或外部NS
	UpPort           string `json:"uplinkPort,omitempty" gorm:"comment:UpPort"`                // 上行端口
	DownPort         string `json:"downlinkPort,omitempty" gorm:"comment:DownPort"`            // 下行端口
}

func (i *GatewayConfigData) AfterSave() (err error) {
	if i.Pattern {
		return nil
	}

	v := viper.New()
	v.SetConfigType("toml")
	v.SetConfigFile("./test.toml")

	err = v.ReadInConfig()
	if err != nil {
		// global.LogErrInFormat("LoraWan配置更新", "读取配置文件信息", err)
		return
	}

	err = ReplaceViperConfigBefore(v, "integration.mqtt.event_topic_template", i.FreqBank+"_"+strconv.Itoa(i.FreqBankConfig), "/")
	if err != nil {
		// global.LogErrInFormat("LoraWan配置更新", "读取配置文件信息", err)
		return
	}
	ReplaceViperConfigBefore(v, "integration.mqtt.state_topic_template", i.FreqBank+"_"+strconv.Itoa(i.FreqBankConfig), "/")
	if err != nil {
		// global.LogErrInFormat("LoraWan配置更新", "读取配置文件信息", err)
		return
	}
	ReplaceViperConfigBefore(v, "integration.mqtt.command_topic_template", i.FreqBank+"_"+strconv.Itoa(i.FreqBankConfig), "/")
	if err != nil {
		// global.LogErrInFormat("LoraWan配置更新", "读取配置文件信息", err)
		return
	}
	// buf := new(bytes.Buffer)
	// err = toml.NewEncoder(buf).Encode(v.AllSettings())
	// if err != nil {
	// 	return
	// }
	// fmt.Println(buf.String())

	// return os.WriteFile("aaa.toml", buf.Bytes(), 0666)
	return v.WriteConfig()
}

func ReplaceViperConfigBefore(v *viper.Viper, key, partstr, symbol string) (err error) {
	str := v.GetString(key)
	index := strings.Index(str, symbol)
	var newstr string
	if index != -1 {
		partafter := str[index:]
		newstr = partstr + partafter
	} else {
		return errors.New("没有符合的分割符")
	}
	v.Set(key, newstr)
	return nil
}
