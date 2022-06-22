package main

import (
	"fmt"
)

const (
	aa = iota
	bb = iota
	cc
	dd
)

const (
	e = iota
	f
	g
)

func iotas() {
	fmt.Println(aa)
	fmt.Println(bb)
	fmt.Println(cc)
	fmt.Println(dd)
	fmt.Println(e)
	fmt.Println(f)
	fmt.Println(g)
	// from constants.go
	fmt.Println(a)
	fmt.Println(b)
	fmt.Printf("%T\n", a)
	fmt.Printf("%T\n", aa)
	fmt.Printf("%T\n", b)
	fmt.Printf("%T\n", c)
	fmt.Printf("%T\n", dd)
	fmt.Printf("%T\n", e)
	fmt.Printf("%T\n", f)
	fmt.Printf("%T\n", g)
}
