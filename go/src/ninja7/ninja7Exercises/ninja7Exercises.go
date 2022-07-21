package main

import (
	"fmt"
)

type person struct {
	first string
}

func exercise1() {
	//create a value and assign it to a variable
	val := 20
	//print address of value
	addr := &val
	fmt.Println(addr)
}

func changeMe(p *person) {
	p1 := person{first: "james"}
	name := (*p).first
	fmt.Println(name)
	fmt.Println(p1)
}

func main() {

	exercise1()
	changeMe(&person{first: "bob"})
	fmt.Println()
}
