package main

import (
	"fmt"
)

const (
	// signed type int
	a int = 42
	// unsigned type float
	b = 43.23
	c = "blahh"
)

func constant() {
	fmt.Printf("%T\n", a)
	fmt.Printf("%T\n", b)
	fmt.Printf("%T\n", c)
}
