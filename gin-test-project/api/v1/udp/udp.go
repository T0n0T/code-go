package udp

import (
	"context"
	"net"
)

type UDPServ struct {
	Name       string
	Conn       *net.UDPConn
	Ctx        context.Context
	Done       context.CancelFunc
	HandleRecv HandleRecv
	stopwrite  chan struct{}
}

type HandleRecv func(*net.UDPAddr, []byte) error

func (u *UDPServ) listenUDP() {
	var data [1024]byte

Loop:
	for {
		select {
		case <-u.Ctx.Done():
			u.stopwrite <- struct{}{}
			break Loop
		default:
			_, addr, err := u.Conn.ReadFromUDP(data[:])
			if err != nil {
				continue
			}
			if u.HandleRecv != nil {
				u.HandleRecv(addr, data[:])
			}
		}
	}
}

func (u *UDPServ) WriteUDP(addr *net.UDPAddr, data []byte) (err error) {
	_, err = u.Conn.WriteToUDP(data, addr)
	return
}
