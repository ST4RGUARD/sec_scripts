package main

import (
	"encoding/json"
	"fmt"
	"os"
	"sort"
)

type user struct {
	First   string
	Last    string
	Age     int
	Sayings []string
}
type person struct {
	First string
	Last  string
	Age   int
}

type ByAge []user

func (p ByAge) Len() int           { return len(p) }
func (p ByAge) Swap(i, j int)      { p[i], p[j] = p[j], p[i] }
func (p ByAge) Less(i, j int) bool { return p[i].Age < p[j].Age }

type ByLastName []user

func (p ByLastName) Len() int           { return len(p) }
func (p ByLastName) Swap(i, j int)      { p[i], p[j] = p[j], p[i] }
func (p ByLastName) Less(i, j int) bool { return p[i].Last < p[j].Last }

func exercise1() {
	u1 := user{First: "Ja", Age: 22}
	u2 := user{First: "Rel", Age: 25}

	users := []user{u1, u2}
	fmt.Println("Users -", users)

	bs, err := json.Marshal(users)
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(string(bs))
}

func exercise2() {
	str := `[{"First":"james","Last":"buns","Age":30},{"First":"dr","Last":"eval","Age":55}]`
	bs := []byte(str)

	var people []person
	err := json.Unmarshal(bs, &people)
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(people)
}

func exercise3() {
	u1 := user{
		First: "Ja",
		Last:  "Rel",
		Age:   22,
		Sayings: []string{
			"test me",
			"is no",
			"blah blah",
		},
	}
	fmt.Println("Encoding to json and printing to stdout")
	err := json.NewEncoder(os.Stdout).Encode(u1)
	if err != nil {
		fmt.Println(err)
	}

}

func exercise4() {
	ints := []int{2, 5, 1, 9, 134, 2, 5353, 32, 4, 69}
	strs := []string{"some thing", "elsething"}

	sort.Ints(ints)
	sort.Strings(strs)

	fmt.Println(strs)
	fmt.Println(ints)
}

func exercise5() {
	//sort user by age, last name, and sayings
	u1 := user{
		First:   "Ja",
		Last:    "Rel",
		Age:     22,
		Sayings: []string{"wool wool", "no no", "def"},
	}
	u2 := user{
		First:   "Rel",
		Last:    "U",
		Age:     25,
		Sayings: []string{"blah blah", "sheep shop", "abc"},
	}

	users := []user{u1, u2}

	fmt.Println("Age - ")
	fmt.Println(ByAge(users))
	fmt.Println("Last - ")
	fmt.Println(ByLastName(users))
	for _, u := range users {
		fmt.Println("sorting user's sayings")
		sort.Strings(u.Sayings)
		for _, v := range u.Sayings {
			fmt.Println(v)
		}
	}

}

func main() {
	exercise1()
	exercise2()
	exercise3()
	exercise4()
	exercise5()
}
