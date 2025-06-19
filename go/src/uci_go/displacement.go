package main

import (
	"fmt"
)

func getInput() (float64, float64, float64, float64) {
	var a, vo, so, time float64
	fmt.Println("Enter acceleration: ")
	fmt.Scan(&a)
	fmt.Println("Enter initial velocity: ")
	fmt.Scan(&vo)
	fmt.Println("Enter initial displacement: ")
	fmt.Scan(&so)
	fmt.Println("Enter time: ")
	fmt.Scan(&time)

	return a, vo, so, time
}

func genDisplaceFn(a, vo, so float64) func(float64) float64 {
	// s = ½ a t2 + vot + so
	return func(t float64) float64 {
		return ((0.5*a)*(t*t) + (vo * t) + so)
	}
}

func showDispalcement(a, vo, so, time float64) {
	displaceFn := genDisplaceFn(a, vo, so)
	fmt.Printf("Displacement after %.2f seconds: %.2f\n", time, displaceFn(time))
}

func main() {
	a, vo, so, time := getInput()
	showDispalcement(a, vo, so, time)
}
