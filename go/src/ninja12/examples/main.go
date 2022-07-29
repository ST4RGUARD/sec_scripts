package main

import (
	"fmt"

	"example.com/m/ninja12/examples/acdc"
	"example.com/m/ninja12/examples/dog"
)

type canine struct {
	name string
	age  int
}

func doggy() {
	fido := canine{name: "Fido", age: dog.Years(10)}
	fmt.Println(fido)
	fmt.Println(dog.YearsTwo(15))
}

func acdcSum() {
	fmt.Println(acdc.Sum(2, 3, 5, 6))
}

func main() {
	acdcSum()
	doggy()
}
