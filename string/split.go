package main

import (
	"fmt"
	"path"
	"path/filepath"
	"strings"
)

func main() {
	demo := "I&love&Go,&and&I&also&love&Python."
	string_slice := strings.Split(demo, "&")

	fmt.Println(path.Base("http://www.baidu.com/file/aa.jpg"))
	fmt.Println(path.Dir("./file//abc///aa.jpg"))
	fmt.Println(path.Join("c:", "aa", "bb", "cc.txt"))
	isMatch, err := path.Match("c:/windows/*/", "c:/windows/system/")
	fmt.Println(isMatch, err)

	fmt.Println(path.Clean("/home/file//abc///aa.jpg")) //返回 /home/file/abc/aa.jpg
	fmt.Println(path.Clean("./file//abc///aa.jpg"))     //返回 file/abc/aa.jpg
	fmt.Println(path.Clean("/../file//abc///aa.jpg"))   //返回 /file/abc/aa.jpg
	fmt.Println("result:", string_slice)
	fmt.Println("len:", len(string_slice))
	fmt.Println("cap:", cap(string_slice))

	fmt.Println(filepath.Clean("c:\\\\aa/c\\baa.exe"))
	fmt.Printf("%q\n", strings.SplitAfterN("foo,bar,baz", ",", 2))
}
