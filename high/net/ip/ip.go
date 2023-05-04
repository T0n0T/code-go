package main

import (
	"fmt"
	"net"
	"syscall"

	"github.com/vishvananda/netlink"
)

func UpdateIP(linkName string, newAddr string) (err error) {
	Addr, err := netlink.ParseAddr(newAddr)
	link, err := netlink.LinkByName(linkName)
	if err != nil {
		return
	}

	// 获取网卡的 IP 地址列表
	addrs, err := netlink.AddrList(link, syscall.AF_INET)
	if err != nil {
		return
	}

	// 删除原有的 IP 地址
	for _, addr := range addrs {
		err = netlink.AddrDel(link, &addr)
		if err != nil {
			return
		}
		fmt.Printf("Deleted address %v from %v\n", addr.IPNet.String(), linkName)
	}

	err = netlink.AddrAdd(link, Addr)
	if err != nil {
		return
	}
	fmt.Printf("Added address %v to %v\n", Addr.IPNet.String(), linkName)
	return
}

func AddIP(linkName string, newAddr string) (err error) {
	Addr, err := netlink.ParseAddr(newAddr)
	if err != nil {
		return
	}
	link, err := netlink.LinkByName(linkName)
	if err != nil {
		return
	}

	err = netlink.AddrAdd(link, Addr)
	if err != nil {
		return
	}
	fmt.Printf("Added address %v to %v\n", Addr.IPNet.String(), linkName)
	return
}

func DeleteIP(linkName string, newAddr string) (err error) {
	link, err := netlink.LinkByName(linkName)
	if err != nil {
		return
	}
	Addr, err := netlink.ParseAddr(newAddr)
	addrs, err := netlink.AddrList(link, syscall.AF_INET)
	if err != nil {
		return
	}

	for _, addr := range addrs {
		if addr.IPNet.Contains(Addr.IP) {
			err = netlink.AddrDel(link, &addr)
			if err != nil {
				return
			}
		}
		fmt.Printf("Deleted address %v from %v\n", addr.IPNet.String(), linkName)
	}
	return
}

func FormatCIDR(IP string, Mask string) string {
	ip := net.ParseIP(IP)
	mask := net.IPMask(net.ParseIP(Mask).To4())

	ones, _ := mask.Size()
	return fmt.Sprintf("%s/%d", ip.String(), ones)
}
