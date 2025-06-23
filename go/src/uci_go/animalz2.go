package main

import (
	"fmt"
)

type Animal interface {
	eat()
	move()
	speak()
}

type animalData struct {
    food, locomotion, noise string
}

func (a animalData) eat() { fmt.Printf("eats %s\n", a.food) }
func (a animalData) move() { fmt.Printf("moves by %s\n", a.locomotion) }
func (a animalData) speak() { fmt.Printf("sounds like %s\n", a.noise) }

type cow struct{ animalData }
type bird struct{ animalData }
type snake struct{ animalData }

var defaultAnimals = map[string]Animal{
	"cow":   cow{animalData{"grass", "walking", "moo"}},
	"bird":  bird{animalData{"worms", "flying", "peep"}},
	"snake": snake{animalData{"mice", "slithering", "hsss"}},
}

func newAnimal(name, animaltype string, animals map[string]Animal) {
	var a Animal
	switch animaltype {
	case "cow":
			a = cow{animalData{"grass", "walk", "moo"}}
	case "bird":
			a = bird{animalData{"worms", "fly", "peep"}}
	case "snake":
			a = snake{animalData{"mice", "slither", "hsss"}}
	default:
			fmt.Println("Unknown animal type")
			return
	}
	animals[name] = a
	fmt.Println("Created it!")
}

func queryAnimal(name string, action string, animals map[string]Animal) {
	animal, exists := animals[name]
	if !exists {
		fmt.Println("Unknown Animal")
	  return
	}
	switch action {
	case "eat":
		defer animal.eat()
	case "move":
		defer animal.move()
	case "speak":
		defer animal.speak()
	default:
		fmt.Println("Unknown Animal Info")
	}
	fmt.Printf("The %s ", name)
}

func chooseCommand (cmd,name,info string, animals map[string]Animal) {
	switch cmd {
	case "newanimal":
		newAnimal(name,info,animals)
	case "query":
		queryAnimal(name,info,animals)
	default:
	  fmt.Println("Not a valid command")
	}
}

func promptInput() (string, string, string) {
	var cmd, name, animaltype string
	fmt.Print("> ")
	fmt.Scanln(&cmd,&name,&animaltype)

	return cmd, name, animaltype
}

func main() {
	animals := make(map[string]Animal)
	
	for k, v := range defaultAnimals {
		animals[k] = v
	}
	for {
		cmd, name, info := promptInput()
		chooseCommand(cmd, name, info, animals)
	}
}
