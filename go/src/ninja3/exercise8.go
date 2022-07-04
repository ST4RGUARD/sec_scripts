package main

import (
	"fmt"
)

func exercise8() {
	num := 1
	//switch statement with no condition
	switch {
	case num == 1:
		fmt.Println("TRUE")
	case 1 == 2:
		fmt.Println("FALSE")
	default:
		fmt.Println("default")
	}

}
