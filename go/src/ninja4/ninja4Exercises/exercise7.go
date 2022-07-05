package main

import "fmt"

//Use slice create multi slice

func sliceMulti() {
	jb := []string{"james", "bond", "shaken, not stirred"}
	mp := []string{"miss", "moneypenny", "hello, james"}
	xp := [][]string{jb, mp}
	fmt.Println(xp)

	for _, v := range xp {
		for _, v := range v {
			fmt.Println("Values - ", v)
		}
	}

}
