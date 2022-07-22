package main

import (
	"encoding/json"
	"fmt"
	"sort"

	"golang.org/x/crypto/bcrypt"
)

type person struct {
	First string
	Last  string
	Age   int
}

type ByAge []person

func (p ByAge) Len() int           { return len(p) }
func (p ByAge) Swap(i, j int)      { p[i], p[j] = p[j], p[i] }
func (p ByAge) Less(i, j int) bool { return p[i].Age < p[j].Age }

type ByFirstName []person

func (p ByFirstName) Len() int           { return len(p) }
func (p ByFirstName) Swap(i, j int)      { p[i], p[j] = p[j], p[i] }
func (p ByFirstName) Less(i, j int) bool { return p[i].First < p[j].First }

type ByLastName []person

func (p ByLastName) Len() int           { return len(p) }
func (p ByLastName) Swap(i, j int)      { p[i], p[j] = p[j], p[i] }
func (p ByLastName) Less(i, j int) bool { return p[i].Last < p[j].Last }

func weRMarshal() {
	spy1 := person{First: "james", Last: "buns", Age: 30}
	spy2 := person{First: "dr", Last: "eval", Age: 55}
	spy3 := person{First: "merk", Last: "nom", Age: 22}

	people := []person{spy1, spy2, spy3}
	fmt.Println("Unsorted")
	fmt.Println("------")
	fmt.Println(people)
	fmt.Println("\nFirst")
	sort.Sort(ByFirstName(people))
	fmt.Println("------")
	fmt.Println(people)
	fmt.Println("\nLast")
	sort.Sort(ByLastName(people))
	fmt.Println("------")
	fmt.Println(people)
	fmt.Println("\nAge")
	sort.Sort(ByAge(people))
	fmt.Println("------")
	fmt.Println(people)
	fmt.Println()
	// fields must be uppercase
	bs, err := json.Marshal(people)
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(string(bs))
}

func weRUNMarshal() {

	// json-to-go web site
	str := `[{"First":"james","Last":"buns","Age":30},{"First":"dr","Last":"eval","Age":55}]`
	ints := []int{2, 5, 1, 9, 134, 2, 5353, 32, 4, 69}

	//acts upon slice - change in place
	sort.Ints(ints)
	fmt.Println(ints)

	bs := []byte(str)

	fmt.Printf("%T\n", str)
	fmt.Printf("%T\n", bs)

	var people []person
	err := json.Unmarshal(bs, &people)
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(people)
}

func weBcryptin() {
	pass := `password123`
	bs, err := bcrypt.GenerateFromPassword([]byte(pass), bcrypt.MinCost)
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println("\n", bs)

	loginPass := `password123a`
	err = bcrypt.CompareHashAndPassword(bs, []byte(loginPass))
	if err != nil {
		fmt.Println("NO LOGIN FOR YOU ")
		return
	}
	fmt.Println("LOGIN SUCCESSFUL")

}

func main() {
	weRMarshal()
	weRUNMarshal()
	weBcryptin()
}
