package main

import (
	"fmt"
)

type person struct {
	first            string
	last             string
	ice_cream_flavor []string
}

type vehicle struct {
	doors int
	color string
}

type truck struct {
	vehicle
	fourWheel bool
}

type sedan struct {
	vehicle
	luxury bool
}

func exercise1() {

	p1 := person{first: "afjwoi", last: "slkjo", ice_cream_flavor: []string{"vanilla", "berry"}}
	p2 := person{first: "jfwo", last: "fwoi", ice_cream_flavor: []string{"chocobo", "nuttle"}}

	fmt.Println(p1.first, p1.last, p1.ice_cream_flavor)
	fmt.Println(p2.first, p2.last, p2.ice_cream_flavor)
	for i, v := range p2.ice_cream_flavor {
		fmt.Println(i, v)
	}
}

func exercise2() {
	p1 := person{first: "ja", last: "rel", ice_cream_flavor: []string{"vanilla", "berry"}}
	m := map[string]person{
		p1.last: p1,
	}

	for k, v := range m {
		fmt.Println(k, v)
		fmt.Println(v.first)
		for i, v := range v.ice_cream_flavor {
			fmt.Println("index: ", i)
			fmt.Println("value: ", v)
		}
	}

	fmt.Println(m)
}

func exercise3() {
	truck := truck{
		fourWheel: true,
		vehicle: vehicle{
			doors: 4,
			color: "gold",
		},
	}
	sedan := sedan{
		vehicle: vehicle{
			doors: 2,
			color: "blue",
		},
		luxury: true,
	}
	fmt.Println(truck)
	fmt.Println(sedan)
	fmt.Println(truck.color)
	fmt.Println(sedan.doors)
}

func exercise4() {

	anon_struct := struct {
		pants  map[string]string
		shirts []string
	}{
		pants: map[string]string{
			"jeans":  "levis",
			"slacks": "docker",
		},
		shirts: []string{"tshirt", "tank"},
	}
	fmt.Println(anon_struct)
	for i, v := range anon_struct.shirts {
		fmt.Println("index: ", i)
		fmt.Println("value: ", v)
	}
}

func main() {
	exercise1()
	exercise2()
	exercise3()
	exercise4()
}
