package main

import (
	"fmt"
	"net"
	"syscall"

	"github.com/vishvananda/netlink"
)

func main() {
	// SetIP("ens38", "192.168.1.5/24")
	UpdateRoute()
}

func SetIP2() {
	linkName := "ens38"         // 修改的网卡名字
	newAddr := "192.168.1.4/16" // 新的 IP 地址和掩码，格式为 CIDR

	// 解析新的 IP 地址和掩码
	ip, ipNet, err := net.ParseCIDR(newAddr)
	if err != nil {
		panic(err)
	}
	fmt.Println(ip)
	fmt.Println(ipNet)
	// 获取需要修改的网卡
	link, err := netlink.LinkByName(linkName)
	if err != nil {
		panic(err)
	}

	// 获取网卡的ip表
	addrs, err := netlink.AddrList(link, syscall.AF_INET)
	if err != nil {
		panic(err)
	}
	fmt.Println(addrs)

	// 删除原有的 IP 地址
	for _, addr := range addrs {
		err = netlink.AddrDel(link, &addr)
		if err != nil {
			panic(err)
		}
		fmt.Printf("Deleted address %v from %v\n", addr.IPNet.String(), linkName)
	}

	// 添加新的 IP 地址
	addr := &netlink.Addr{
		IPNet: &net.IPNet{
			IP:   ip,
			Mask: ipNet.Mask,
		},
		Label: "",
	}
	err = netlink.AddrAdd(link, addr)
	if err != nil {
		panic(err)
	}
	fmt.Printf("Added address %v to %v\n", addr.IPNet.String(), linkName)
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
	fmt.Printf("Added address %v to %v\n", Addr.IPNet.String(), linkName)
	return
}
