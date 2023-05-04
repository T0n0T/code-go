package main

import (
	"fmt"
	"strconv"
	"syscall"

	"github.com/vishvananda/netlink"
)

func main() {
	// err := UpdateIP("ens37", "192.168.1.33/24")
	// if err != nil {
	// 	fmt.Println(err)
	// }
	// err := UpdateRoute("ens37", "192.168.1.6")
	// if err != nil {
	// 	fmt.Println(err)
	// }
	_, info := GetConfigInfo()
	fmt.Println(info)
}

type IpConfig struct {
	Pattern string `json:"pattern"` // 工作模式，自动分配、静态分配或者禁用
	Ip      string `json:"ip"`      // IP 配置
	Mask    string `json:"mask"`    // 掩码
	Gateway string `json:"gateway"` // 网关
}

func GetConfigInfo() (err error, info *IpConfig) {
	link, err := netlink.LinkByName("ens37")
	if err != nil {
		return
	}

	// 获取网卡的 IP 地址列表
	ip, _ := netlink.AddrList(link, syscall.AF_INET)

	routes, err := netlink.RouteList(link, syscall.AF_INET)
	return nil, &IpConfig{
		Pattern: "xxx",
		Ip:      ip[0].IP.To4().String(),
		Mask:    MaskTo4(ip[0].Mask.String()),
		Gateway: routes[0].Gw.To4().String(),
	}
}

func MaskTo4(hexmask string) string {
	maskInt, _ := strconv.ParseInt(hexmask, 16, 64)
	// mask := fmt.Sprintf("%s.%s.%s.%s", string(maskInt>>24), string(maskInt>>16), string(maskInt>>8), string(maskInt))
	mask := fmt.Sprintf("%d.%d.%d.%d", maskInt>>24, maskInt>>16, maskInt>>8, maskInt)
	return mask
}
