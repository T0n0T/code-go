package model

type SerialStruct struct {
	Port     string `json:"port"`
	Baudrate int    `json:"baudrate"`
	StopBit  int    `json:"stop"`
	Data     string `json:"data"`
	Parity   int    `json:"parity"`
}
