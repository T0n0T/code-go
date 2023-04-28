package udp

const (
	Head byte = 0xAA

	//web服务端到lorawan服务器
	LoraWanLogUP byte = 0x10
	DbChange     byte = 0x11

	LoraGateUP byte = 0x20

	WebReply byte = 0x00
)
