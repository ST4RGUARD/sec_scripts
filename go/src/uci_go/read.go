package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

type Name struct {
	fname string
	lname string
}

func read() {
	// read file
	reader := bufio.NewReader(os.Stdin)

	fmt.Println("Enter file: ")
	filename, err := reader.ReadString('\n')
	filename = strings.TrimSpace(filename)
	if err != nil {
		fmt.Println("Error opening file:", err)
		return
	}

	file, err := os.Open(filename)
	if err != nil {
		fmt.Println("Error opening file:", err)
		return
	}
	scanner := bufio.NewScanner(file)

	var names []Name

	for scanner.Scan() {
		line := scanner.Text()
		words := strings.Fields(line)

		// should have first and last name only
		if len(words) >= 2 {
			n := Name{
				fname: words[0],
				lname: words[1],
			}
			names = append(names, n)
		} else {
			fmt.Println("file needs to contain 2 names")
			break
		}
	}

	// print structs
	for _, n := range names {
		fmt.Printf("%+v\n", n)
	}
}

func main() {
	read()
}
