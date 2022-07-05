package main

import (
	"fmt"
)

//Create Slice - holds 10 values of TYPE int

func testSlice() {
	slice := [10]int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	for i := 0; i < len(slice); i++ {
		fmt.Printf(" - TYPE -> %T", slice)
		fmt.Println("\n", slice[i])
	}
}
