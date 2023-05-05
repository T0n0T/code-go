package main

import (
	"fmt"
	"os"
	"strings"
	"time"
)

var log map[int]*logline

type logline struct {
	Time   time.Time
	Result string
	Path   string
	Action string
	Detail string
}

func main() {

	log = make(map[int]*logline)

	b, _ := os.ReadFile("./2023-05-05.log")

	// re := regexp.MustCompile(`\[\w+\]([\d/ -:]+)\.\d+\s+`)

	content := string(b)
	lines := strings.Split(content, "\n")
	for id, line := range lines {
		var idv logline

		// matches := re.FindStringSubmatch(line)
		// if len(matches) > 0 {
		// 	timestamp := matches[1]
		// 	time, _ := time.Parse("2006/01/02 - 15:04:05.000", timestamp)
		// 	idv.Time = time
		// } else {
		// 	fmt.Println("No match")
		// }
		msgs := strings.SplitN(line, "\t", 5)
		if len(msgs) < 5 {
			break
		}
		time, _ := time.Parse("2006/01/02 - 15:04:05.000", strings.TrimPrefix(msgs[0], "[gva]"))
		idv.Time = time
		idv.Result = msgs[1]
		idv.Path = msgs[2]
		idv.Action = msgs[3]
		idv.Detail = msgs[4]

		log[id] = &idv
	}
	fmt.Println(log)

}
