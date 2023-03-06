package serial

import (
	"fmt"
	"strings"
	"test/gin-test-project/model"

	"github.com/gin-gonic/gin"
	"github.com/olahol/melody"
	goserial "go.bug.st/serial"
)

const (
	Dev_name = "/dev/ttyCH9344USB1"
)

var Dev_mode = goserial.Mode{BaudRate: 115200}

type SerialService struct {
	Melody   *melody.Melody
	cfg      goserial.Mode
	tty      goserial.Port
	Port_num string
	sign     chan string
}

func (s *SerialService) ReadSerial(ss *melody.Session, sign chan string) {
	buf := make([]byte, 512)
	var tmpstr string
	var status string
Loop:
	for {
		select {
		case status = <-sign:
			if status == "close" {
				break Loop
			}
		default:
			tmpstr = ""
			for {
				num, _ := s.tty.Read(buf)
				if num > 0 {
					tmpstr += string(buf[:num])
				} else if num == 0 {
					ss.Write([]byte("\r\nEOF"))
					break
				}
				//查找读到信息的结尾标志
				if strings.Index(tmpstr, "\n") > 0 {
					break
				}
			}
			ss.Write([]byte(tmpstr))
		}
	}
	ss.Write([]byte(s.Port_num + "close\n"))
	fmt.Println("close")
}

func (s *SerialService) WriteSerial(ss *melody.Session, msg []byte) {
	num, err := s.tty.Write(msg)
	if num != len(msg) || err != nil {
		ss.Write([]byte(s.Port_num + "wrong\n"))
	}
}

func (s *SerialService) GetSerialList() (List []string, err error) {
	return goserial.GetPortsList()
}

func (s *SerialService) closeport(ss *melody.Session) {
	s.sign <- "close"
	err := s.tty.Close()
	if err != nil {
		return
	}
}

func (s *SerialService) openport(ss *melody.Session) {
	var err error

	s.tty, err = goserial.Open(Dev_name, &Dev_mode)
	// s.tty, err = goserial.Open(s.Port_num, &s.cfg)
	if err != nil {
		s.Melody.Broadcast([]byte("串口打开失败...\n"))
		fmt.Println(err.Error())
		return
	}
	ss.Write([]byte(s.Port_num + " open...\n"))
	go s.ReadSerial(ss, s.sign)
}

func (s *SerialService) OpenServ(c *gin.Context) {
	s.Melody = melody.New()
	s.Melody.HandleMessage(s.WriteSerial)
	s.Melody.HandleConnect(s.openport)
	s.Melody.HandleDisconnect(s.closeport)
	s.Melody.HandleRequest(c.Writer, c.Request)
}

func (s *SerialService) SetConfig(cfg_json model.SerialStruct) {
	s.cfg.BaudRate = cfg_json.Baudrate
	s.cfg.DataBits = cfg_json.StopBit
	s.cfg.Parity = goserial.Parity(cfg_json.Parity)
	s.Port_num = cfg_json.Port
}
