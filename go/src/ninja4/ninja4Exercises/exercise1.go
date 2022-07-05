package main

import (
	"fmt"
)

//Create Array - holds 5 values of TYPE int

func testArray() {
	var array [5]int
	array[0] = 1
	array[1] = 2
	array[2] = 3
	array[3] = 4
	array[4] = 5
	for i := 0; i < len(array); i++ {
		fmt.Printf(" - TYPE -> %T", array)
		fmt.Println("\n", array[i])
	}
}
