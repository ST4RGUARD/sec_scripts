package main

import (
	"errors"
	"fmt"
	"log"
	"os"
)

func printErr() {
	n, err := fmt.Println("Hello")
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(n)
}

func fileErr() {
	_, err := os.Open("no-file.txt")
	if err != nil {
		//fmt.Println("Error:", err)
		//log.Println("Error:", err) //can setlog to file
		//log.Fatalln("Error:", err)
		panic(err)
	}
}

func sqrt(f float64) (float64, error) {
	if f < 0 {
		return 0, errors.New("sqrt of neg number")
	}
	return 42, nil
}

func newError() {
	_, err := sqrt(-10)
	if err != nil {
		log.Fatalln("Error:", err)
	}
}

func main() {
	printErr()
	//fileErr()
	newError()
}
