package main

import (

	"fmt"
	"sort"
	"strconv"

)

func slice() {
	sli := make([]int,3)
	i   := 0
	var input string
	for i < len(sli) {
	  // not checking for bad input
		fmt.Print("Enter int: ")
		fmt.Scan(&input)
		if input == "X" || input == "x" {
			break
		}
		val, _ := strconv.Atoi(input)
		sli = append(sli,val)
		i+=1
    // sort then print slice contents
	}
	sort.Ints(sli)
	fmt.Println(sli)
}

func main() {
	slice()
}
