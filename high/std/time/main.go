package main

import (
	"fmt"
	"time"
)

func main() {
	start := time.Now()
	cost := time.Since(start)
	fmt.Println(start.Format(time.RFC3339))
	fmt.Println(cost.String())
}
