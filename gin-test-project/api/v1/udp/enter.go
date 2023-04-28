package udp

import (
	"context"
	"net"
)

type UDPService struct {
	TestApi
}

var (
	services []*UDPServ
)

func (*UDPService) InitFunc() (err error) {
	ctx, cancle := context.WithCancel(context.Background())
	addr := net.UDPAddr{
		IP:   net.ParseIP("0.0.0.0"),
		Port: 30000,
	}

	RegisterUDPServ(&addr, "UDP-server", nil, ctx, cancle)
	return nil
}

func RegisterUDPServ(address *net.UDPAddr, name string, handle HandleRecv, ctx context.Context, done context.CancelFunc) (err error) {
	conn, err := net.ListenUDP("udp", address)
	if err != nil {
		// defer conn.Close()
		return
	}
	service := UDPServ{
		Name:       name,
		Conn:       conn,
		Ctx:        ctx,
		Done:       done,
		HandleRecv: handle,
	}

	services = append(services, &service)
	go service.listenUDP()
	return nil
}

func UnRegisterUDPServ(name string) {
	for _, service := range services {
		if service.Name == name {
			service.Conn.Close()
			service.Ctx.Done()
			services = deleteFromSlice(services, service)
			return
		}
	}
}

func deleteFromSlice(slice []*UDPServ, elem *UDPServ) []*UDPServ {
	for i, e := range slice {
		if e == elem {
			slice = append(slice[:i], slice[i+1:]...)
			break
		}
	}
	return slice
}
