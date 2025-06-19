package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"os"
)

func makejson() {
	var person map[string]string
	person = make(map[string]string)

	reader := bufio.NewReader(os.Stdin)
	fmt.Println("Enter a name: ")
	name, _ := reader.ReadString('\n')
	fmt.Println("Enter an address: ")
	addr, _ := reader.ReadString('\n')

	person[name] = addr
	jayson, _ := json.Marshal(person)
	fmt.Println(string(jayson))
}

func main() {
	makejson()
}
