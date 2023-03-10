package main

import (
	"context"
	"fmt"
	"time"
)

//这个例子传递一个具有任意截止时间的上下文，告诉一个阻塞函数一旦到达它就应该放弃它的工作

func task(ctx context.Context, s string) {
lqz:
	for {
		select {
		case <-ctx.Done():
			fmt.Println("task:我收到取消指令，我结束了")
			fmt.Println(ctx.Err())
			// 正常到时间：context deadline exceeded
			// 手动调用cancel ：context canceled

			break lqz // 结束掉 label位置的循环

		default:
			fmt.Println("打印一次传入的值：", s)
			time.Sleep(1 * time.Second)

		}
	}
}
func task2(ctx context.Context, s string) {
lqz:
	for {
		select {
		case <-ctx.Done():
			fmt.Println("task:我收到取消指令，我结束了")
			fmt.Println(ctx.Err())
			// 正常到时间：context deadline exceeded
			// 手动调用cancel ：context canceled

			break lqz // 结束掉 label位置的循环
		case <-time.After(1 * time.Second):
			fmt.Println("1s时间到了，打印：", s)
			fmt.Println(ctx.Err()) // 执行到此，如果还没到结束时间，Err为nil
		}
	}
}
func main() {
	// 1 正常到时间
	//parent := context.Background()
	//t:=time.Now().Add(5*time.Second) // 5s后的时间
	//ctx, _ := context.WithDeadline(parent,t)
	//go task(ctx, "lqz is Nb")
	//time.Sleep(10 * time.Second) // 睡个10s钟，由于5s结束，后5s没有输出

	// 2 手动调用cancle取消
	//parent := context.Background()
	//t := time.Now().Add(5 * time.Second) // 5s后的时间
	//ctx, cancel := context.WithDeadline(parent, t)
	//go task(ctx, "lqz is Nb")
	//time.Sleep(3 * time.Second) // 睡个3s钟，由于5s还没到，手动结束
	//cancel()
	//time.Sleep(7 * time.Second) // 再睡7s看输出

	//3 1s后输出一次内容的另一种写法
	parent := context.Background()
	t := time.Now().Add(5 * time.Second) // 5s后的时间
	ctx, cancel := context.WithDeadline(parent, t)
	go task2(ctx, "lqz is Nb")
	time.Sleep(3 * time.Second) // 睡个3s钟，由于5s还没到，手动结束
	cancel()
	time.Sleep(7 * time.Second) // 再睡7s看输出

}
