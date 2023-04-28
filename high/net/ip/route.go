package main

import (
	"fmt"
	"net"
	"syscall"

	"github.com/vishvananda/netlink"
)

func UpdateRoute() {
	link, err := netlink.LinkByName("ens38")
	if err != nil {
		panic(err)
	}

	//获取路由表
	routes, err := netlink.RouteList(link, syscall.AF_INET)
	if err != nil {
		panic(err)
	}

	for _, v := range routes {
		fmt.Println(v)
	}

	route := new(netlink.Route)
	route = &netlink.Route{
		LinkIndex: link.Attrs().Index,
		Src:       net.ParseIP("192.168.1.5"),
		Gw:        net.ParseIP("192.168.1.33"),
		Protocol:  syscall.RTPROT_BOOT,
		Priority:  100,
		Table:     syscall.RT_TABLE_MAIN,
		// Type:      syscall.RTN_UNICAST,
		Flags: 0,
	}

	// for _, r := range routes {
	// 	netlink.RouteDel(&r)
	// 	// if r.Dst == nil && r.Src == nil {
	// 	// 	route = &r
	// 	// 	fmt.Println(route)
	// 	// 	break
	// 	// }
	// }

	if err := netlink.RouteAdd(route); err != nil {
		panic(err)
	}

	// fmt.Println("Gateway updated successfully")
}
