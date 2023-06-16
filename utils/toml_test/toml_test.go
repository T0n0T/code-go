package toml_test

import (
	"fmt"
	"testing"
	"utils"
)

func TestToml(t *testing.T) {
	a := utils.GatewayConfigData{
		Keepalive:        "30",
		LocalGatewayID:   "123",
		LoraWANServiceIP: "1.1.1.1",
		FreqBank:         "cn460",
		FreqBankConfig:   3,
		Pattern:          false,
		UpPort:           "1700",
		DownPort:         "1700",
	}
	err := a.AfterSave()
	if err != nil {
		fmt.Println(err)
	}
}
