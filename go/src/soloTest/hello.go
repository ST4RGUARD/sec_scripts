package main

import "fmt"

var z = true

//var z string = `raw string "literal"`

// create own type superman of int
type superman int

var xx superman
var yy int

func main() {
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

}
