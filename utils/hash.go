package utils

import (
	"crypto/sha256"
	"encoding/hex"
	"io"
	"os"
)

func Gethash(path string) (hash string) {
	file, _ := os.Open(path)
	h_ob := sha256.New()
	_, err := io.Copy(h_ob, file)
	if err == nil {
		hash := h_ob.Sum(nil)
		hashvalue := hex.EncodeToString(hash)
		return hashvalue
	} else {
		return "哈希错误"
	}
}
