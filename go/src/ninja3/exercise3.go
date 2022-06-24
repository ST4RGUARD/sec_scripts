package main

import (
	"fmt"
	"time"
)

func exercise3() {
	//print the years you've been alive
	time := time.Now()
	current_year := time.Year()
	birthyear := 1984
	for birthyear <= current_year {
		fmt.Println(birthyear)
		birthyear++
	}

}
