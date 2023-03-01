package parse

import (
	"bytes"
	"encoding/binary"
	"encoding/gob"
)

func GoBinToStruct(data []byte, v any) (err error) {
	buf := bytes.NewReader(data)
	err = gob.NewDecoder(buf).Decode(v)
	return
}

func GoStructToBin(v any) (data []byte, err error) {
	var buf bytes.Buffer
	if err = gob.NewEncoder(&buf).Encode(v); err != nil {
		return
	}
	data = buf.Bytes()
	return
}

func BinToStruct(data []byte, v any) (err error) {
	buf := bytes.NewReader(data)
	err = binary.Read(buf, binary.LittleEndian, v)

	return
}

func StructToBin(v any) (data []byte, err error) {
	buf := &bytes.Buffer{}
	if err = binary.Write(buf, binary.LittleEndian, v); err != nil {
		return
	}
	data = buf.Bytes()

	return
}
