package main

import (
	"fmt"
)

//address in memory where value is stored *int = pointer to int

func pointer() {
	a := 42
	fmt.Println(a)
	fmt.Println(&a)
	fmt.Printf("%T\n", a)
	fmt.Printf("%T\n", &a)
	//assign pointer of a to var
	var b *int = &a
	fmt.Println(b)
	//value stored at address - dereference address
	fmt.Println(*b)

}

func main() {
	pointer()
}
