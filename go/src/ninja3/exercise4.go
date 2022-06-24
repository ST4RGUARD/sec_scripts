package main

import (
	"fmt"
	"time"
)

func exercise4() {
	//print the years you've been alive using for {}
	time := time.Now()
	current_year := time.Year()
	birthyear := 1984
	for {
		if birthyear > current_year {
			break
		}
		fmt.Println(birthyear)
		birthyear++
	}

}
