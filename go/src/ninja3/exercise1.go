package main

import (
	"fmt"
)

func exercise1() {
	// print numbers 1 - 1000
	for num := 1; num <= 1000; num++ {
		fmt.Printf("%d|", num)
	}
}
