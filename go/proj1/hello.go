package main

import "fmt"

// global or package level
// default values are zero value
var z = true

//var z string = `raw string "literal"`

// create own type superman of int
type superman int

var x superman
var y int

func hello() {
	// short declaration
	s := fmt.Sprintf("%v\t%v\t%v", x, y, z)
	fmt.Println(s)
	fmt.Printf("%T\n", y)
	fmt.Println(x, y, z)
	fmt.Println(x)
	fmt.Printf("%T ", x)
	x = 42
	fmt.Println("hiii")
	fmt.Println(x)
	fmt.Printf("%T", int(x))
	fmt.Println(y)
	fmt.Println(z)
	// cannot assign var cape to y - diff types
	// y = cape
	// now using conversion
	// fmt.Println(cape)
}
