package parse

import (
	"bytes"
	"encoding/binary"
	"encoding/gob"
	"fmt"
	"log"
)

func GoBinToStruct(data []byte, v any) (err error) {
	buf := bytes.NewReader(data)
	if err := gob.NewDecoder(buf).Decode(v); err != nil {
		log.Fatal("decode error:", err)
	}
	return
}

func GoStructToBin(v any) (data []byte, err error) {
	var buf bytes.Buffer
	if err = gob.NewEncoder(&buf).Encode(v); err != nil {
		log.Fatal("encode error:", err)
	}
	data = buf.Bytes()
	return
}

func BinToStruct(data []byte, v any) (err error) {
	buf := bytes.NewReader(data)
	if err = binary.Read(buf, binary.LittleEndian, v); err != nil {
		fmt.Println(err)
	}
	return
}

func StructToBin(v any) (data []byte, err error) {
	buf := &bytes.Buffer{}
	if err = binary.Write(buf, binary.LittleEndian, v); err != nil {
		fmt.Println(err)
		return
	}
	data = buf.Bytes()

	return
}
