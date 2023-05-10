package main

import (
	"fmt"
	"time"
)

func main() {
	// PrintTimeFormat("2006/01/02 - 15:04:05.000")
	// TimeoutWithTimer(4 * time.Second)
	p := new(PongConter)
	p.Start(3 * time.Second)
	time.Sleep(2 * time.Second)
	p.ReSet()
	for {
		select {
		case a := <-p.timer.C:
			fmt.Println("end  ", a)
		default:
		}
	}
}

func PrintTimeFormat(layout string) {
	start := time.Now()
	fmt.Println(start.Format(layout))
	cost := time.Since(start)
	fmt.Println(cost.String())
}

func TimeoutWithTimer(d time.Duration) {
	// 重置计时器
	reset := func(t *time.Timer) {
		if !t.Stop() {
			fmt.Println("!stop")
			<-t.C
		}
		t.Reset(d)
	}

	// 创建计时器
	timer := time.NewTimer(d)

	// 模拟重置计时器的操作
	go func() {
		time.Sleep(2 * time.Second)
		fmt.Println("reset", time.Now())
		reset(timer)
		time.Sleep(2 * time.Second)
		fmt.Println("reset", time.Now())
		reset(timer)
	}()

	// 启动计时器
	// go func() {
	// 	fmt.Println(<-timer.C)
	// }()

	// 等待计时器超时或被重置
	for {
		select {
		case <-time.After(d * time.Second):
			fmt.Println("Internal error: timer did not trigger")
		case a := <-timer.C:
			fmt.Println(a)
			fmt.Println("end  ", time.Now())
		}
	}
}

type PongConter struct {
	d     time.Duration
	timer *time.Timer
}

func (p *PongConter) ReSet() {
	if !p.timer.Stop() {
		<-p.timer.C
	}
	p.timer.Reset(p.d)
	fmt.Println("reset", time.Now())
}

func (p *PongConter) Start(dead time.Duration) {
	p.timer = time.NewTimer(dead)
	p.d = dead
	fmt.Println("start", time.Now())
	// go func() {
	// 	time.Sleep(p.d)
	// }()
}
