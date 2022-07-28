package main

import (
	"encoding/json"
	"errors"
	"fmt"
	"log"
)

type person struct {
	First   string
	Last    string
	Sayings []string
}

type customError struct {
	info string
}

type sqrtError struct {
	lat  string
	long string
	err  error
}

func (se sqrtError) Error() string {
	return fmt.Sprintf("math error: %v %v %v", se.lat, se.long, se.err)
}

func (ce customError) Error() string {
	return fmt.Sprintf("here is the error: %v", ce.info)
}

func ex3Foo(e error) {
	fmt.Println("foo ran - ", e, e.(customError).info) //assertion
}

func toJSON(a interface{}) ([]byte, error) {
	bs, err := json.Marshal(a)
	if err != nil {
		return []byte{}, fmt.Errorf("error in toJSON: %v", err)
	}
	return bs, nil
}

func sqrt(f float64) (float64, error) {
	if f < 0 {
		e := errors.New("error here in sqrt")
		return 0, sqrtError{"50.22 N", "99.45 W", e}
	}
	return 42, nil
}

func exercise1() {
	p1 := person{First: "First", Last: "Last", Sayings: []string{"i'm a person", "ok"}}
	bs, err := json.Marshal(p1)
	fmt.Println(string(bs))

	if err != nil {
		log.Fatalln("JSON did not marshal", err)
	}
}

func exercise2() {
	p1 := person{First: "First", Last: "Last", Sayings: []string{"i'm a person", "ok"}}
	bs, err := toJSON(p1)

	if err != nil {
		log.Fatalln(err)
	}

	fmt.Println(string(bs))
}

func exercise3() {
	c1 := customError{
		info: "need coffee",
	}
	ex3Foo(c1)
}

func exercise4() {
	_, err := sqrt(-10.23)
	if err != nil {
		log.Println(err)
	}
}

func main() {
	exercise1()
	exercise2()
	exercise3()
	exercise4()
}
