go	

package main

import (
	"fmt"
	"time"
)

var counter int

func inc_race_test(){
	for i := 0; i < 5; i++ {
		counter++
		fmt.Printf("counter: %s",counter)
		time.Sleep(10 * time.Millisecond)
	}
}

func main(){
	go inc_race_test
	go inc_race_test

	time.Sleep(1 * time.Second)
	fmt.Printf("counter: %s",counter)
}
