package testing

import (
	"testing"
	"utils"
)

const TestStr = "../../build/can"

func TestHash(t *testing.T) {
	str := utils.Gethash(TestStr)
	t.Log("hash of " + TestStr + " is " + str)
}
