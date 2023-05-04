package main

import (
	"net"
	"syscall"

	"github.com/vishvananda/netlink"
)

func newRoute(link netlink.Link, Gw net.IP) (err error) {

	// src := net.ParseIP(SrcAddr)
	// if src == nil {
	// 	return errors.New("无法解析的网卡IP")
	// }
	route := new(netlink.Route)
	route = &netlink.Route{
		LinkIndex: link.Attrs().Index,
		// Src:       src,
		Gw:       Gw,
		Protocol: syscall.RTPROT_BOOT,
		Priority: 100,
		Table:    syscall.RT_TABLE_MAIN,
		Type:     syscall.RTN_UNICAST,
		Flags:    0,
	}

	return netlink.RouteAdd(route)
}

func DeleteRoute(GwAddr string) (err error) {
	routes, err := netlink.RouteList(nil, syscall.AF_INET)
	if err != nil {
		return
	}

	for _, v := range routes {
		if v.Gw.String() == GwAddr {
			err = netlink.RouteDel(&v)
			if err != nil {
				return
			}
		}
	}
	return nil
	// return errors.New("没有匹配的网关配置")
}

func UpdateRoute(linkName string, newGw net.IP) (err error) {
	link, err := netlink.LinkByName(linkName)
	if err != nil {
		return
	}

	// newGw := net.ParseIP(GwAddr)
	// if newGw == nil {
	// 	return errors.New("无法解析的网关IP")
	// }

	// 获取默认网关
	routes, err := netlink.RouteList(link, syscall.AF_INET)
	if routes == nil {
		return newRoute(link, newGw)
	}
	if err != nil {
		return
	}

	defaultRoute := new(netlink.Route)
	for _, r := range routes {
		if r.Dst == nil {
			defaultRoute = &r
			break
		}
	}

	// 修改默认网关
	defaultRoute.Gw = newGw
	return netlink.RouteReplace(defaultRoute)
}
