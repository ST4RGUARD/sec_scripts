package main

import (
	"fmt"
)

func array() {
	//arrays not really used , use slices
	var x [5]int
	fmt.Println(x)
	x[3] = 42
	fmt.Println(x)
	fmt.Println(len(x))
}

func slice() {
	//composite literal
	x := []int{4, 5, 7, 8, 42}
	fmt.Println(x)
}

func sliceLoop() {
	x := []int{4, 5, 6, 9, 32}
	fmt.Println(len(x))
	fmt.Println(x[0])
	fmt.Println(x[1])

	for i, v := range x {
		fmt.Println(i, v)
	}
}

func slicingSlice() {
	x := []int{4, 5, 6, 9, 32}
	fmt.Println(x[1:])
	fmt.Println(x[1:3])

}

func sliceAppend() {
	x := []int{4, 5, 6, 9, 32}
	fmt.Println(x)
	x = append(x, 12, 33, 103)
	fmt.Println(x)

	y := []int{232, 31, 342}
	x = append(x, y...)
	fmt.Println(x)
}

func sliceDelete() {
	x := []int{4, 5, 6, 9, 32, 3, 2}
	x = append(x[:2], x[4:]...)
	fmt.Println(x)
	last := x[len(x)-1]
	fmt.Println(last)
}

func makez() {
	z := make([]int, 3, 10)
	//z := new([100]int)[0:10]
	fmt.Println(z)

	fmt.Println(cap(z))
	z[0] = 42
	//z[9] = 999
	z = append(z, 0, 999)
	fmt.Println(z)
	//fmt.Println(len(x))
	//fmt.Println(cap(x))
}

func multidimSlice() {
	jj := []string{"Jfjwo", "Jafjow", "Oreo", "Coffee"}
	fmt.Println(jj)
	cj := []string{"Cfwafw", "Jafea", "Chocolate", "Tea"}
	fmt.Println(cj)
	xp := [][]string{jj, cj}
	fmt.Println(xp)
}

func maps() {
	m := map[string]int{
		"JJ": 37,
		"CJ": 32,
	}
	fmt.Println(m)
	fmt.Println(m["JJ"])
	//value checking - whether exists
	v, ok := m["JaRel"]
	fmt.Println(v)
	fmt.Println(ok)

	if v, ok := m["JJ"]; ok {
		fmt.Println("IF PRINT / I EXIST", v)
	}
}

func mapAdd() {
	m := map[string]int{
		"JJ": 37,
		"CJ": 32,
	}

	m["KJ"] = 56

	for k, v := range m {
		fmt.Println(k, v)
	}
}

func mapDelete() {
	m := map[string]int{
		"JJ": 37,
		"CJ": 32,
	}

	m["KJ"] = 56
	delete(m, "JJ")

	for k, v := range m {
		fmt.Println("WAMAN", k, v)
	}
}

func main() {
	array()
	slice()
	sliceLoop()
	slicingSlice()
	sliceAppend()
	sliceDelete()
	makez()
	multidimSlice()
	maps()
	mapAdd()
	mapDelete()
}
