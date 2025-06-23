package main

import (
	"fmt"
)

type Animal1 struct {
	food       string
	locomotion string
	noise      string
}

func animalList1() map[string]Animal1 {
	return map[string]Animal1{
		"cow":   {"grass", "walking", "moo"},
		"bird":  {"worms", "flying", "peep"},
		"snake": {"mice", "slithering", "hsss"},
		"cat":   {"fish", "walking", "meow"},
	}
}

func (a Animal1) eat() {
	fmt.Printf("eats %s", a.food)
}

func (a Animal1) move() {
	fmt.Printf("moves by %s", a.locomotion)
}

func (a Animal1) speak() {
	fmt.Printf("sounds like %s", a.noise)
}

func describeAnimal(animalName, info string) {
	animalMap := animalList1()
	animal, avail := animalMap[animalName]
	if !avail {
		fmt.Println("Unknown Animal")
	}

	switch info {
	case "eat":
		defer animal.eat()
	case "move":
		defer animal.move()
	case "speak":
		defer animal.speak()
	default:
		fmt.Println("Unknown Animal Info")
	}
	fmt.Printf("The %s ", animalName)
}

func getInput() (string, string) {
	var animal, info string
	fmt.Print("> ")
	fmt.Scanln(&animal, &info)

	return animal, info
}

func main() {
	animal, info := getInput()
	describeAnimal(animal, info)
}
