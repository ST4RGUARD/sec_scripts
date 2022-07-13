package main

import (
	"fmt"
)

type person struct {
	first string
	last  string
}

type agent struct {
	person
	ltk bool
}

func funcLesson(one string, two string) (string, bool) {
	a := fmt.Sprint(one, two, "three")
	b := false
	return a, b
}

func variadicSum(x ...int) int {
	fmt.Println(x)
	fmt.Printf("%T\n", x)

	sum := 0
	for _, v := range x {
		sum += v
	}
	fmt.Println("sum is ", sum)
	return sum
}

func foo() {
	fmt.Println("foo")
}
func bar() {
	fmt.Println("bar")
}

//methods
func (s agent) announce() {
	fmt.Println("i am ", s.first, s.last, " - the agent")
}

func (s person) announce() {
	fmt.Println("i am ", s.first, s.last, " - the person")
}

//value can be of more than one type
//interface, if you have this method, then you're my type
type human interface {
	announce()
}

func me(h human) {
	fmt.Println("i called human")
	switch h.(type) {
	case person:
		fmt.Println("i was passed to me ", h.(person).first)
	case agent:
		fmt.Println("i was passed to me ", h.(agent).first)
	}
	fmt.Println("i was passed to me ", h)
}
func secretAgents() {
	spy1 := agent{
		person: person{
			"james",
			"bond",
		},
		ltk: true,
	}

	spy2 := agent{
		person: person{
			"dr",
			"evil",
		},
	}
	fmt.Println("i'm a spy")
	spy1.announce()
	me(spy2)
}

func barReturn() func() int {
	return func() int {
		return 1984
	}
}

func even(f func(xi ...int) int, vi ...int) int {
	var yi []int
	for _, v := range vi {
		if v%2 == 0 {
			fmt.Println("even :", v)
			yi = append(yi, v)
		} else {
			fmt.Println("odd :", v)
		}
	}
	return f(yi...)
}

func factorialR(n int) int {
	if n == 0 {
		return 1
	}
	return n * factorialR(n-1)
}

//4*3*2*1
func factorialL(n int) int {
	total := 1
	for ; n > 0; n-- {
		total *= n
	}
	return total
}

func main() {
	x, y := funcLesson("won", "der")
	fmt.Println(x)
	fmt.Println(y)
	variadicSum(3, 4, 5, 6, 7, 8)
	xi := []int{3, 4, 5, 6, 8, 9, 10, 11}
	num2 := even(variadicSum, xi...)
	fmt.Println(num2)
	z := variadicSum(xi...)
	fmt.Println(z)
	// ensure order execution
	defer foo()
	bar()
	secretAgents()
	func(x int) {
		fmt.Println("anon func #", x)
	}(23)

	f := func(exp string) {
		fmt.Println("my expression", exp)
	}
	f("woo")
	//returning a func
	br := barReturn()
	fmt.Printf("%T\n", br)
	num := br()
	fmt.Println(num)
	n := factorialR(4)
	l := factorialL(4)
	fmt.Println(n)
	fmt.Println(l)
}
