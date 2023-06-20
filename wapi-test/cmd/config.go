/*
Copyright © 2023 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"bytes"
	"fmt"
	"hash/crc32"
	"os"
	"strconv"
	"strings"

	"github.com/spf13/cobra"
)

var (
	as_flag  *bool
	sta_flag *bool
)

const COMMAND = "AT+CERT_CERT="

type CERT struct {
	Index   int
	Part_N  int
	Total_N int
	Data    []byte
	Crc     string
}

//AT+CERT_CERT=1,1,1,cA]MDQCGHMy+o8EYcDVB/dR4C6CzvVQ3JUkT6OwNwIYCUqmZ5hcBDaRlLWYaGQ5NBC0]8Ke4rTTj]-----END CERTIFICATE-----]549BC358
//AT+CERT_CERT=[cert_index],[part_no] ,[total_no],[cert_data][crc32]

func (c *CERT) String() string {
	c.calcrc()
	return COMMAND + strconv.Itoa(c.Index) + "," + strconv.Itoa(c.Part_N) + "," + strconv.Itoa(c.Total_N) + "," + string(c.Data[:]) + c.Crc
}

func (c *CERT) calcrc() {
	crc := crc32.ChecksumIEEE(c.Data[:])
	c.Crc = fmt.Sprintf("%X", crc)
}

// configCmd represents the chat command
var configCmd = &cobra.Command{
	Use:   "config",
	Short: "配置模块",

	Run: func(cmd *cobra.Command, args []string) {
		if *as_flag {
			fmt.Fprintln(os.Stdout, "导入AS证书")
			SendCer(1, C.Setting.CA.ASPath)
			os.Exit(0)
		}
		if *sta_flag {
			fmt.Fprintln(os.Stdout, "导入STA证书")
			SendCer(0, C.Setting.CA.STAPath)
			os.Exit(0)
		}
		fmt.Fprintln(os.Stdout, "请选择导入的证书")
	},
}

func init() {
	rootCmd.AddCommand(configCmd)

	as_flag = configCmd.Flags().BoolP("as", "", false, "导入配置文件中路径指向的AS证书")
	sta_flag = configCmd.Flags().BoolP("sta", "", false, "导入配置文件中路径指向的STA证书")
	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// configCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// configCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}

func SendCer(typef int, path string) {
	data, err := os.ReadFile(path)
	if err != nil {
		fmt.Printf("无法读取证书文件：%v\n", err)
		os.Exit(1)
	}
	b := CerByte(data)
	max := len(b) / 480
	for i := 0; i < max+1; i++ {
		send_data := CERT{
			Index:   typef,
			Part_N:  i,
			Total_N: max,
		}
		if i == max {
			send_data.Data = b[i*480:]
		} else {
			send_data.Data = b[i*480 : (i+1)*480]
		}

		sendch <- send_data.String()
		if !strings.Contains(<-recvch, "OK") {
			fmt.Fprintln(os.Stderr, "导入证书失败")
			os.Exit(1)
		}
	}
	fmt.Fprintln(os.Stderr, "导入证书成功")
}

func CerByte(data []byte) []byte {
	// 转义 0x0D 和 0x0A 字节为 '[' 和 ']'
	escaped := bytes.NewBuffer([]byte{})

	for _, b := range data {
		switch b {
		case 0x0D:
			escaped.WriteByte(0x5B)
		case 0x0A:
			escaped.WriteByte(0x5D)
		default:
			escaped.WriteByte(b)
		}
	}

	return escaped.Bytes()
}
