package main

import (
	"fmt"
)

func exercise2() {
	//print every letter in alphabet
	for char := 'A'; char <= 'Z'; char++ {
		for i := 0; i < 3; i++ {
			fmt.Printf("%U '%c'\n", char, char)
		}
		fmt.Println()
	}

}
