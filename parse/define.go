package parse

// generate from .c NOT EDIT!

const (
	DX_FILE_CODE  = 0xE1E2E3E4 //文件起始特征码
	DX_FILE_DBVER = 0x01000001 //文件版本
)

type DX_FILD_HEAD struct {
	StartCode   uint32
	DbFileVison uint32
	WYear       int16
	Month       uint8
	Day         uint8
	Hour        uint8
	Minute      uint8
	Second      uint8
	ByRes       uint8
	PointsNum   uint32
	DwRes5      uint32
	DwRes6      uint32
	DwRes7      uint32
}

type LORA_REC struct {
	Bsptype       int32
	ServerPort    int32
	NRes1         int32
	NRes2         int32
	ServerIP      [64]int8
	ApplicationID [64]int8
	SzRes1        [64]int8
	SzRes2        [64]int8
	SzRes3        [64]int8
	SzRes4        [64]int8
}

type DXK_REC struct {
	ServerPort  int32
	BszTotalNum int32
	DxkNo       int32
	UpTxEQTimer int32
	DevSN       [64]int8
	DevType     [64]int8
	DevName     [64]int8
	Mfginfo     [64]int8
	HardVersion [64]int8
	ServerIP    [64]int8
}

type JDX_REC struct {
	PointNo      int32
	DxkNo        uint8
	BszNo        uint8
	ByRes1       uint8
	ByRes2       uint8
	DevSN        [64]int8
	DevType      [64]int8
	DevName      [64]int8
	Mfginfo      [64]int8
	HardVersion  [64]int8
	GroundWireNo [64]int8
	DxMacAddr    [8]uint8
	DxctRfid     [8]uint8
	BszDisplayNo [64]int8
}

type DXZ_REC struct {
	PointNo          int32
	Rfid             [8]uint8
	GroundPileWireNo [64]int8
	Description      [64]int8
}

type MQTTCLIENT_REC struct {
	IfSSL                 int32
	ServerPort            int32
	ServerIP              [32]int8
	UpTxEQTimer           int32
	CaFile                [64]int8
	ClientCertificateFile [64]int8
	ClientkeyFile         [64]int8
	Reserv                [128]uint8
}
