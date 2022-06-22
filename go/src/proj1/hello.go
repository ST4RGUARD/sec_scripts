package main

import "fmt"

// global or package level
// default values are zero value
var z = true

//var z string = `raw string "literal"`

// create own type superman of int
type superman int

var xx superman
var yy int

func hello() {
	// short declaration
	s := fmt.Sprintf("%v\t%v\t%v", xx, yy, z)
	fmt.Println(s)
	fmt.Printf("%T\n", yy)
	fmt.Println(xx, yy, z)
	fmt.Println(xx)
	fmt.Printf("%T ", xx)
	xx = 42
	fmt.Println("hiii")
	fmt.Println(xx)
	fmt.Printf("%T", int(xx))
	fmt.Println(yy)
	fmt.Println(z)
	// cannot assign var cape to y - diff types
	// y = cape
	// now using conversion
	// fmt.Println(cape)
}
