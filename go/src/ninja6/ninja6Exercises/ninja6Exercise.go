package main

import (
	"fmt"
	"math"
)

//exercise 5
type square struct {
	side float32
}
type circle struct {
	radius float32
}

type shape interface {
	area() float32
}

func (s square) area() float32 {
	return s.side * s.side
}

func (c circle) area() float32 {
	return math.Pi * c.radius * c.radius
}

func areaInfo(s shape) {
	fmt.Println(s.area())
}

//exercise 4
type person struct {
	first string
	last  string
	age   int
}

func (s person) speak() {
	fmt.Println("i am ", s.first, s.last, " - the person - ", s.age, " years old")
}

func secretAgent() {
	spy := person{
		"james",
		"bond",
		37,
	}
	fmt.Println("secret agent reporting...")
	spy.speak()
}

func exercise1() int {
	return 0
}

//variadiac param
func exercise2a(x ...int) int {
	sum := 0
	for _, v := range x {
		sum += v
	}
	return sum
}

//slice param
func exercise2b(x []int) int {
	sum := 0
	for _, v := range x {
		sum += v
	}
	return sum
}

func exercise3() {
	fmt.Println("i defer")
}

func exercise8() func() int {
	return func() int {
		return 1984
	}
}

func exercise9() {
	g := func(xi []int) int {
		if len(xi) == 0 {
			return 0
		}
		if len(xi) == 1 {
			return xi[0]
		}
		return xi[0] + xi[len(xi)-1]
	}

	x := num(g, []int{1, 2, 3, 4, 5})
	fmt.Println(x)
}

func num(f func(xi []int) int, ii []int) int {
	n := f(ii)
	n++
	return n
}

func enclosed() {
	x := 1
	fmt.Println("x is ", x, "here")
	f := func() {
		x := 3
		fmt.Println("x is ", x, "here")
	}
	x += 1
	f()
	fmt.Println("finally x + 1 is ", x)

}

func main() {
	n := exercise1()
	fmt.Println(n)
	nums := []int{2, 5, 23, 13, 3}
	sumA := exercise2a(nums...)
	fmt.Println(sumA)
	sumB := exercise2b(nums)
	fmt.Println(sumB)
	defer exercise3()
	secretAgent()
	circle := circle{
		radius: 12.34,
	}
	square := square{
		side: 5,
	}
	areaInfo(circle)
	areaInfo(square)
	//exercise 6
	func(x int) {
		fmt.Println("anon func #", x)
	}(23)

	//erercise 7
	f := func() {
		fmt.Println("nothing here")
	}
	f()
	ex8 := exercise8()
	fmt.Printf("I'm the type %T \n", ex8)
	ex8Func := ex8()
	fmt.Println(ex8Func)
	exercise9()
	enclosed()
}
