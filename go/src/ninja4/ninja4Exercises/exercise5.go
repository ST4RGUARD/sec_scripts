package main

import (
	"fmt"
)

//Use slicing to delete values

func sliceDelete() {
	slice1 := []int{42, 43, 44, 45, 46, 47, 48, 49, 50, 51}
	fmt.Println(slice1)
	slice1 = append(slice1[:3], slice1[6:]...)
	fmt.Println(slice1)

}
