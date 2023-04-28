package udp

// 固定的4字节头部
type Header struct {
	Head    byte
	Msgtypr byte
	Lens    [2]byte
}

func parseHeader(data []byte) {
	// head := data[:1]
}

func DataHandle(data []byte) {
	parseHeader(data[:4])
}
