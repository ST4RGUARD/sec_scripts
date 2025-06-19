package main

import (
	"fmt"
)

type Animal struct {
	food       string
	locomotion string
	noise      string
}

func animalList() map[string]Animal {
	return map[string]Animal{
		"cow":   {"grass", "walking", "moo"},
		"bird":  {"worms", "flying", "peep"},
		"snake": {"mice", "slithering", "hsss"},
		"cat":   {"fish", "walking", "meow"},
	}
}

func (a Animal) eat() {
	fmt.Printf("eats %s", a.food)
}

func (a Animal) move() {
	fmt.Printf("moves by %s", a.locomotion)
}

func (a Animal) speak() {
	fmt.Printf("sounds like %s", a.noise)
}

func describeAnimal(animalName, info string) {
	animalMap := animalList()
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
	var animal string
	var info string
	fmt.Print("> ")
	fmt.Scanln(&animal, &info)

	return animal, info
}

func main() {
	animal, info := getInput()
	describeAnimal(animal, info)
}
