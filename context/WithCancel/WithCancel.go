package main

import (
	"context"
	"fmt"
	"time"
)

func taskcancel(ctx context.Context, s string) {
lqz:
	for {
		select {
		case <-ctx.Done():
			fmt.Println("task:我收到取消指令，我结束了")
			break lqz // 结束掉 label位置的循环
		default:
			fmt.Println("打印一次传入的值：", s)
			time.Sleep(1 * time.Second)

		}
	}
}
func main() {
	parent := context.Background()
	ctx, cancle := context.WithCancel(parent)
	go taskcancel(ctx, "lqz is Nb")
	go taskcancel(ctx, "lqz is handsome")
	time.Sleep(5 * time.Second) // 睡个5s钟，发现上面两句话不停打印
	cancle()                    // 通过ctx控制，上面两个go协程关闭
	time.Sleep(5 * time.Second) // 睡个5s钟，发现确实被停止了，不打印了

}
