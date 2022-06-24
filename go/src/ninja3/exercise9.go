package main

import (
	"fmt"
)

func exercise9() {
	//switch statement with expression as variable of TYPE string with identifier "favSport"
	favSport := "cycling"
	switch favSport {
	case "cycling":
		fmt.Println("up up up")
	case "snowboarding":
		fmt.Println("powderpuff")
	default:
		fmt.Println("default")
	}

}
