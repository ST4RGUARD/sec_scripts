package main

import (
	"encoding/json"
	"fmt"
)

type user struct {
	First string
	Age   int
}

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

func main() {
	exercise1()
}
