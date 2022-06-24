package main

import (
	"fmt"
)

func exercise5() {
	//print remainder for each number between 10 and 100 when divided by 4
	for num := 10; num <= 100; num++ {
		remainder := num % 4
		fmt.Println(remainder)
	}

}
