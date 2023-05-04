package main

import (
	"context"
	"fmt"
	"net"
)

func DnsSet() {
	nameserver := "192.168.1.1"

	// 配置 DNS 解析器
	resolver := &net.Resolver{
		PreferGo: true,
		Dial: func(_ context.Context, _ string, _ string) (net.Conn, error) {
			return net.Dial("udp", nameserver+":53")
		},
	}

	// 解析域名
	addrs, err := resolver.LookupHost(context.Background(), "www.baidu.com")
	if err != nil {
		fmt.Println(err)
		return
	}

	// 输出解析结果
	for _, addr := range addrs {
		fmt.Println(addr)
	}
}
