package main

import (
	"bufio"
	"fmt"
	"os/exec"
	"strings"
)

type Dfdisk struct {
	Size    string
	Used    string
	Avail   string
	Percent string
}

func Dfpath(path string) (disk Dfdisk, err error) {
	// 执行 df -h 命令并获取输出信息
	output, err := exec.Command("df", "-h").Output()
	if err != nil {
		return
	}

	// 将输出信息按行解析
	scanner := bufio.NewScanner(strings.NewReader(string(output)))

	var lines []string
	var num int
	for scanner.Scan() {
		num++
		if num == 0 {
			continue
		}
		line := scanner.Text()
		lines = append(lines, line)
	}

	for _, line := range lines {
		diskmsg := strings.Fields(line)
		if diskmsg[len(diskmsg)-1] == path {
			disk.Size = diskmsg[len(diskmsg)-5]
			disk.Used = diskmsg[len(diskmsg)-4]
			disk.Avail = diskmsg[len(diskmsg)-3]
			disk.Percent = diskmsg[len(diskmsg)-2]
			break
		}
	}
	return
}

func main() {
	disk, err := Dfpath("/")
	if err != nil {
		panic(err)
	}
	fmt.Printf("Size: %s, Used: %s, Available: %s\n", disk.Size, disk.Used, disk.Avail)
}
