package main

import (
	"fmt"
)

type person struct {
	first string
	last  string
	age   int
}

type secretAgent struct {
	person
	ltk bool
}

func printPPL() {
	//type - value
	anon_struct := struct {
		first string
		last  string
	}{
		first: "first",
		last:  "name",
	}
	p1 := person{first: "james", last: "bond"}
	sa1 := secretAgent{
		person: person{
			first: "James",
			last:  "Bond",
			age:   100,
		},
		ltk: true,
	}
	fmt.Println(p1)
	fmt.Println(p1.first, p1.last)
	fmt.Println(sa1.first, sa1.last, sa1.age, sa1.ltk)
	fmt.Println(anon_struct.first)
}

func main() {
	printPPL()
}
