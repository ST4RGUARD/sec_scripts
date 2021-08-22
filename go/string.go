package main

import (
	"fmt"
)

func string() {
	s := "Hello"

	for i := 0; i < len(s); i++ {
		fmt.Printf("%#x\n", s[i])
	}

}
