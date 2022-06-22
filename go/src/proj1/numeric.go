package main

import (
	"fmt"
	"runtime"
)

var x int8 = -128
var y int8 = 127

func numeric() {
	a := 7
	b := 42.34
	fmt.Println(a)
	fmt.Println(b)
	fmt.Println(x)
	fmt.Println(y)
	fmt.Printf("%T\n", a)
	fmt.Printf("%T\n", b)
	fmt.Printf("%T\n", x)
	fmt.Printf("%T\n", y)
	fmt.Println(runtime.GOOS)
	fmt.Println(runtime.GOARCH)
}
