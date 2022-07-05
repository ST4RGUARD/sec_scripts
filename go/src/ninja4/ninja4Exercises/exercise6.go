package main

import "fmt"

//Use slicing make and append to store all states in US

func sliceMake() {
	states := make([]string, 2)
	var US = []string{"Alabama", "Alaska"}

	for i := 0; i < len(states); i++ {
		states[i] = US[i]
		fmt.Println(i, US[i])
	}

}
