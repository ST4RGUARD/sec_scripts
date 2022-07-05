package main

import (
	"fmt"
)

//Use slicing to create new slices

func slicingSlice() {
	slice := [10]int{42, 43, 44, 45, 46, 47, 48, 49, 50, 51}
	fmt.Println("\n", slice[0:5])
	fmt.Println("\n", slice[5:10])
	fmt.Println("\n", slice[2:7])
	fmt.Println("\n", slice[1:6])
}
