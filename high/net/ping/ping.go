package main

import (
	"fmt"
	"time"

	"github.com/go-ping/ping"
	probing "github.com/prometheus-community/pro-bing"
)

type PingWriter interface {
	Write(msg string)
}

type testping struct{}

func (*testping) Write(msg string) {
	fmt.Println(msg)
}

func main() {
	// c := make(chan os.Signal, 1)
	// signal.Notify(c, os.Interrupt)
	c := make(chan struct{}, 3)
	Ping("192.168.1.1", c, &testping{})
	// Ping2("192.168.1.1", c)
}

func Ping(host string, c chan struct{}, Writer PingWriter) (err error) {
	pinger, err := probing.NewPinger(host)
	if err != nil {
		return
	}

	// listen
	go func() {
		for range c {
			pinger.Stop()
		}
	}()

	pinger.OnRecv = func(pkt *probing.Packet) {
		Writer.Write(fmt.Sprintf("%d bytes from %s: icmp_seq=%d time=%v ttl=%v\n",
			pkt.Nbytes, pkt.IPAddr, pkt.Seq, pkt.Rtt, pkt.TTL))
	}
	pinger.OnDuplicateRecv = func(pkt *probing.Packet) {
		Writer.Write(fmt.Sprintf("%d bytes from %s: icmp_seq=%d time=%v ttl=%v (DUP!)\n",
			pkt.Nbytes, pkt.IPAddr, pkt.Seq, pkt.Rtt, pkt.TTL))
	}
	pinger.OnFinish = func(stats *probing.Statistics) {
		Writer.Write(fmt.Sprintf("\n--- %s ping statistics ---\n", stats.Addr))
		Writer.Write(fmt.Sprintf("%d packets transmitted, %d packets received, %d duplicates, %v%% packet loss\n",
			stats.PacketsSent, stats.PacketsRecv, stats.PacketsRecvDuplicates, stats.PacketLoss))
		Writer.Write(fmt.Sprintf("round-trip min/avg/max/stddev = %v/%v/%v/%v\n",
			stats.MinRtt, stats.AvgRtt, stats.MaxRtt, stats.StdDevRtt))
	}

	pinger.Count = -1
	pinger.Size = 24
	pinger.Interval = time.Second
	pinger.Timeout = time.Second * 10
	pinger.TTL = 64
	pinger.SetPrivileged(false)

	Writer.Write(fmt.Sprintf("PING %s (%s):\n", pinger.Addr(), pinger.IPAddr()))

	err = pinger.Run()
	return
}

func Ping2(host string, c chan struct{}) (err error) {
	pinger, err := ping.NewPinger(host)
	if err != nil {
		return
	}

	// listen
	go func() {
		for range c {
			pinger.Stop()
		}
	}()

	pinger.OnRecv = func(pkt *ping.Packet) {
		fmt.Printf("%d bytes from %s: icmp_seq=%d time=%v\n",
			pkt.Nbytes, pkt.IPAddr, pkt.Seq, pkt.Rtt)
	}

	pinger.OnDuplicateRecv = func(pkt *ping.Packet) {
		fmt.Printf("%d bytes from %s: icmp_seq=%d time=%v ttl=%v (DUP!)\n",
			pkt.Nbytes, pkt.IPAddr, pkt.Seq, pkt.Rtt, pkt.Ttl)
	}

	pinger.OnFinish = func(stats *ping.Statistics) {
		fmt.Printf("\n--- %s ping statistics ---\n", stats.Addr)
		fmt.Printf("%d packets transmitted, %d packets received, %v%% packet loss\n",
			stats.PacketsSent, stats.PacketsRecv, stats.PacketLoss)
		fmt.Printf("round-trip min/avg/max/stddev = %v/%v/%v/%v\n",
			stats.MinRtt, stats.AvgRtt, stats.MaxRtt, stats.StdDevRtt)
	}

	fmt.Printf("PING %s (%s):\n", pinger.Addr(), pinger.IPAddr())

	pinger.SetPrivileged(false)

	return pinger.Run()
}
