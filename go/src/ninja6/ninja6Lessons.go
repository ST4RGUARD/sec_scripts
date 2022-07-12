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

func main() {
	x, y := funcLesson("won", "der")
	fmt.Println(x)
	fmt.Println(y)
	variadicSum(3, 4, 5, 6, 7, 8)
	xi := []int{3, 4, 5, 6}
	z := variadicSum(xi...)
	fmt.Println(z)
	// ensure order execution
	defer foo()
	bar()
	secretAgents()
}
