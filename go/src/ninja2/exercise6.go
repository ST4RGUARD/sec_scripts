package main

import (
	"fmt"
)

const (
	// const a  & b set in exercise 3, can't redeclare here
	aa = 2022 + iota
	bb = 2022 + iota
	c  = 2022 + iota
	d  = 2022 + iota
)

func exercise6() {
	fmt.Println(aa, bb, c, d)
}
