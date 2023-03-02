package parse

import (
	"bytes"
	"errors"
	"fmt"
	"os"
	"unsafe"
)

type Config struct {
	Path string
	Kind string
	Head DX_FILD_HEAD
	Rec  any
}

type FILD_Config interface {
	WriterConfig() (err error)
	ReadConfig() (err error)
}

var _ FILD_Config = &Config{}

func BytesCombine(pBytes ...[]byte) []byte {
	len := len(pBytes)
	s := make([][]byte, len)
	for index := 0; index < len; index++ {
		s[index] = pBytes[index]
	}
	sep := []byte("")
	return bytes.Join(s, sep)
}

func (c *Config) checkConfigHead(file *os.File) (num int, err error) {
	data_head := make([]byte, unsafe.Sizeof(c.Head))
	num, err = file.Read(data_head)
	if err != nil {
		err = errors.New("read " + c.Kind + " head failed")
		return
	}
	if err = BinToStruct(data_head, &c.Head); err != nil {
		err = errors.New("parse " + c.Kind + " head failed")
		return
	}
	if c.Head.PointsNum != 1 {
		err = errors.New("" + c.Kind + " head is illegal")
		return
	}

	return
}

func (c *Config) recParse(file *os.File, length int, num int) (data_rec []byte, err error) {
	data_rec = make([]byte, length)

	num, err = file.ReadAt(data_rec, int64(num))
	if err != nil {
		err = errors.New("read " + c.Kind + " rec failed")
		return
	}
	if num != length {
		err = errors.New("read " + c.Kind + " rec failed, loss bytes")
		return
	}

	return data_rec, nil
}

func (c *Config) parseConfigRec(num int, file *os.File) (err error) {
	switch c.Kind {
	case "LORA_REC":
		p := LORA_REC{}
		data_rec, err := c.recParse(file, int(unsafe.Sizeof(p)), num)
		if err != nil {
			fmt.Println(err.Error())
			break
		}
		err = BinToStruct(data_rec, &p)
		if err != nil {
			break
		}
		c.Rec = p
	case "DXK_REC":
		p := DXK_REC{}
		data_rec, err := c.recParse(file, int(unsafe.Sizeof(p)), num)
		if err != nil {
			break
		}
		err = BinToStruct(data_rec, &p)
		if err != nil {
			break
		}
		c.Rec = p
	case "JDX_REC":
		p := JDX_REC{}
		data_rec, err := c.recParse(file, int(unsafe.Sizeof(p)), num)
		if err != nil {
			break
		}
		err = BinToStruct(data_rec, &p)
		if err != nil {
			break
		}
		c.Rec = p
	case "DXZ_REC":
		p := DXZ_REC{}
		data_rec, err := c.recParse(file, int(unsafe.Sizeof(p)), num)
		if err != nil {
			break
		}
		err = BinToStruct(data_rec, &p)
		if err != nil {
			break
		}
		c.Rec = p
	case "MQTTCLIENT_REC":
		p := MQTTCLIENT_REC{}
		data_rec, err := c.recParse(file, int(unsafe.Sizeof(p)), num)
		if err != nil {
			break
		}
		err = BinToStruct(data_rec, &p)
		if err != nil {
			break
		}
		c.Rec = p
	default:
		err = errors.New("没有匹配的配置模式")
		// if err != nil {
		// 	break
		// }
	}

	return
}

func (c *Config) BitsConfig() (data []byte, err error) {
	buf, err := StructToBin(c.Head)
	if err != nil {
		return
	}
	buf1, err := StructToBin(c.Rec)
	if err != nil {
		return
	}
	data = BytesCombine(buf, buf1)
	return
}

func (c *Config) WriterConfig() (err error) {
	file, err := os.Create(c.Path)
	if err != nil {
		err = errors.New("create " + c.Kind + " para file failed")
		return
	}
	data, err := c.BitsConfig()
	file.Write(data)
	defer file.Close()
	return
}

func (c *Config) ReadConfig() (err error) {
	file, err := os.Open(c.Path)
	if err != nil {
		err = errors.New("open " + c.Kind + " para file failed")
		return
	}
	defer file.Close()

	num, err := c.checkConfigHead(file)
	if err != nil {
		return
	}
	if err = c.parseConfigRec(num, file); err != nil {
		return
	}

	return
}

func CreateConfig(kind string) (c Config) {
	c.Head.StartCode = DX_FILE_CODE
	c.Head.DbFileVison = DX_FILE_DBVER
	c.Kind = kind
	switch c.Kind {
	case "LORA_REC":
		c.Rec = LORA_REC{}
	case "DXK_REC":
		c.Rec = DXK_REC{}
	case "JDX_REC":
		c.Rec = JDX_REC{}
	case "DXZ_REC":
		c.Rec = DXZ_REC{}
	case "MQTTCLIENT_REC":
		c.Rec = MQTTCLIENT_REC{}
	default:
		fmt.Println("没有匹配的配置模式")
	}
	return
}
