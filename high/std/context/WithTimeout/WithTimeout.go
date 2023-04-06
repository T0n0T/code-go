package main

import (
	"context"
	"fmt"
	"time"
)

//一个带有超时的上下文，告诉一个阻塞函数它应该在超时结束后放弃它的工作

func task(ctx context.Context) {
	select {
	case <-ctx.Done():
		fmt.Println("task:我结束了")
		// cancle函数取消会打印context canceled
		// 到时间取消会打印：context deadline exceeded
		fmt.Println(ctx.Err())
	case <-time.After(3 * time.Second):
		fmt.Println("3s时间到了")
		fmt.Println(ctx.Err()) // 执行到此，如果还没到结束时间，Err为nil

	}

}

func main() {
	// ctx, cancle := context.WithTimeout(context.Background(), 1*time.Second) // 打印
	ctx, _ := context.WithTimeout(context.Background(), 2*time.Second)
	go task(ctx)

	// time.Sleep(3 * time.Second)
	// cancle()
	time.Sleep(3 * time.Second)

}
