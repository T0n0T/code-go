package main

import (
	"context"
	"fmt"
	"time"
)

func task(ctx context.Context) {
	fmt.Println(ctx.Value("name"))
	select {
	case <-ctx.Done():
		fmt.Println("task:我结束了")
		fmt.Println(ctx.Err())
	case <-time.After(1 * time.Second):
		fmt.Println("1s时间到了")
		fmt.Println(ctx.Err())

	}

}

func main() {
	ctx, _ := context.WithTimeout(context.Background(), 1*time.Second) // 1s超时的ctx
	ctx = context.WithValue(ctx, "name", "lqz")
	go task(ctx)
	time.Sleep(5 * time.Second)
}
