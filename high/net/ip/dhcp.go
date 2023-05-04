package main

import (
	"context"
	"fmt"
	"log"
	"net"
	"os"
	"strings"

	"github.com/insomniacslk/dhcp/dhcpv4"
	"github.com/insomniacslk/dhcp/dhcpv4/client4"
	"github.com/insomniacslk/dhcp/dhcpv4/nclient4"
	"github.com/vishvananda/netlink"
)

func DhcpSet() (err error) {
	c := client4.NewClient()
	link, _ := netlink.LinkByName("lan1")
	conversation, err := c.Exchange("lan1")
	for _, packet := range conversation {
		log.Print(packet.Summary())
		if packet.MessageType() == dhcpv4.MessageTypeAck {
			addr := &netlink.Addr{
				IPNet: &net.IPNet{
					IP:   packet.YourIPAddr,
					Mask: packet.Options.Get(dhcpv4.OptionSubnetMask),
				},
			}
			fmt.Println(packet.YourIPAddr)
			fmt.Println(packet.YourIPAddr.DefaultMask())
			fmt.Println(packet.Options.Get(dhcpv4.OptionSubnetMask))
			netlink.AddrAdd(link, addr)

			gw := packet.Options.Get(dhcpv4.OptionRouter)
			fmt.Println(gw)
			UpdateRoute("lan1", gw)
		}
	}
	// error handling is done *after* printing, so we still print the
	// exchanged packets if any, as explained above.
	return
}

func DHCPNset(linkname string) (err error) {
	c, err := nclient4.New(linkname)
	if err != nil {
		return
	}

	link, _ := netlink.LinkByName(linkname)
	l, err := c.Request(context.Background())
	if err != nil {
		return
	}

	addr := &netlink.Addr{
		IPNet: &net.IPNet{
			IP:   l.ACK.YourIPAddr,
			Mask: l.ACK.SubnetMask(),
		},
	}
	netlink.AddrAdd(link, addr)
	UpdateRoute(linkname, l.ACK.Router()[0])

	UpdateReslov(l.ACK.DNS())
	fmt.Println(l.ACK.Summary())
	return
}

func UpdateReslov(dns []net.IP) {
	// 读取resolv.conf文件的内容
	data, err := os.ReadFile("/etc/resolv.conf")
	if err != nil {
		fmt.Println("读取resolv.conf文件出错：", err)
		return
	}

	// 将文件内容转换成字符串
	content := string(data)

	// 将字符串按行分割成数组
	lines := strings.Split(content, "\n")
	var newlines []string
	var dnslines []string
	// 遍历每一行，如果是nameserver行则替换为新的DNS服务器地址
	for _, line := range lines {
		if strings.HasPrefix(line, "nameserver") {
			dnslines = append(dnslines, line)
		} else {
			newlines = append(newlines, line)
		}
	}

	for _, v := range dns {
		dnslines = append(dnslines, "nameserver "+v.To4().String())
	}
	newlines = append(newlines, dnslines...)

	// 将修改后的内容拼接为字符串
	newContent := strings.Join(newlines, "\n")

	// 将修改后的内容写入resolv.conf文件中
	err = os.WriteFile("/etc/resolv.conf", []byte(newContent), 0644)
	if err != nil {
		fmt.Println("写入resolv.conf文件出错：", err)
		return
	}

	fmt.Println("修改resolv.conf文件成功")
}
