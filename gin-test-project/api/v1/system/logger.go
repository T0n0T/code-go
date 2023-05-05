package system

import (
	"gin-test-project/utils"
	"os"
	"regexp"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
)

type LoggerApi struct{}

type logline struct {
	Time   time.Time
	Result string
	Path   string
	Action string
	Detail string
}

func (*LoggerApi) GetLog(c *gin.Context) {
	date := c.Query("createdAt")
	log, err := GetLogByDate(date)
	if err != nil {
		utils.FailWithMessage("日志获取失败", c)
	}
	utils.OkWithData(log, c)
}

func GetLogByDate(date string) (log map[int]*logline, err error) {
	log = make(map[int]*logline)
	b, err := os.ReadFile("./" + date + ".log")
	if err != nil {
		return
	}

	r := regexp.MustCompile(`(info|error)`)

	content := string(b)
	lines := strings.Split(content, "\n")
	for id, line := range lines {
		var idv logline

		msgs := strings.SplitN(line, "\t", 5)
		if len(msgs) < 5 {
			break
		}
		time, _ := time.Parse("2006/01/02 - 15:04:05.000", strings.TrimPrefix(msgs[0], "[gva]"))
		idv.Time = time

		match := r.FindString(msgs[1])
		idv.Result = match
		idv.Path = msgs[2]
		idv.Action = msgs[3]
		idv.Detail = msgs[4]

		log[id] = &idv
	}
	return
}
