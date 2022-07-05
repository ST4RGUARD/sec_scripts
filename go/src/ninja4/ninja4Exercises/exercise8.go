package main

import "fmt"

//create Map with a key of TYPE string, person's last_first name and a value of type []string - stores their fav things + Exercise 9 add record

func testMap() {
	p_info := map[string][]string{
		"bond_james":      []string{"shaken,not stirred", " martinis", "women"},
		"moneypenny_miss": []string{"james bond", "literature", "computer science"},
		"no_dr":           []string{"being evil", "ice cream", "sunsets"},
	}

	p_info["meior"] = []string{"stuff", "more stuff"}

	for k, v := range p_info {
		fmt.Println("Record: ", k)
		for i, v := range v {
			fmt.Printf("\t Values - %v \t\t Index - %v \n", v, i)
		}
	}

}
