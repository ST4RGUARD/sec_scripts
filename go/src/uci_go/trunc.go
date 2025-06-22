package main

import (
	"fmt"
)

func trunc() {
	var x int32
	var num float32 
	fmt.Print("Enter a floating point number: ")
	fmt.Scanln(&num)

	x = int32(num)
	fmt.Println(x)
}
