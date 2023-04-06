package main

import (
	"encoding/json"
	"fmt"
)

type Movie struct {
	Title  string   `json:"title"`
	Year   int      `json:"year"`
	Price  int      `json:"price"`
	Actors []string `json:"actors"`
}

func main() {
	movie := Movie{"涩图", 2077, 10, []string{"aaa", "bbb"}}

	jsonstr, err := json.Marshal(movie)
	if err != nil {
		fmt.Println("json marshal error ", err)
		return
	}
	fmt.Printf("jsonstr: %s\n", jsonstr)

	mymovie := Movie{}
	err = json.Unmarshal(jsonstr, &mymovie)
	if err != nil {
		fmt.Println("json unmarshal fail", err)
		return
	}
	fmt.Println(mymovie)
}
