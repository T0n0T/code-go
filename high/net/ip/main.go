package main

import (
	"fmt"

	"github.com/vishvananda/netlink"
)

func main() {
	err := DHCPNset("lan1")
	// DnsSet()
	if err != nil {
		fmt.Println(err)
	}
	// SetIP("ens38", "192.168.1.141/24")
	// err := DeleteRoute("192.168.1.1")
	// if err != nil {
	// 	fmt.Println(err)
	// }
	// UpdateRoute("ens38", "192.168.1.1")
	// if err != nil {
	// 	fmt.Println(err)
	// }
}

func SetIP(linkName string, newAddr string) (err error) {
	Addr, err := netlink.ParseAddr(newAddr)
	// netlink.ParseIPNet("255.255.255.0")
	// 获取需要修改的网卡

	fmt.Println(Addr)

	link, err := netlink.LinkByName(linkName)
	if err != nil {
		return
	}

	// 获取网卡的 IP 地址列表
	// addrs, err := netlink.AddrList(link, syscall.AF_INET)
	// if err != nil {
	// 	return
	// }

	// 删除原有的 IP 地址
	// for _, addr := range addrs {
	// 	err = netlink.AddrDel(link, &addr)
	// 	if err != nil {
	// 		return
	// 	}
	// 	fmt.Printf("Deleted address %v from %v\n", addr.IPNet.String(), linkName)
	// }

	// 添加新的 IP 地址
	// addr := &netlink.Addr{
	// 	IPNet: &net.IPNet{
	// 		IP:   ip,
	// 		Mask: ipNet.Mask,
	// 	},
	// 	Label: "",
	// }
	err = netlink.AddrAdd(link, Addr)
	if err != nil {
		return
	}
	fmt.Println(Addr.IP)
	// fmt.Printf("Added address %v to %v\n", Addr.IPNet.String(), linkName)
	return
}
