package main

import "fmt"

//map delete record

func mapDelete() {
	p_info := map[string][]string{
		"bond_james":      []string{"shaken,not stirred", " martinis", "women"},
		"moneypenny_miss": []string{"james bond", "literature", "computer science"},
		"no_dr":           []string{"being evil", "ice cream", "sunsets"},
	}

	delete(p_info, "bond_james")

	for k, v := range p_info {
		fmt.Println("Record: ", k)
		for i, v := range v {
			fmt.Printf("\t Values - %v \t\t Index - %v \n", v, i)
		}
	}

}
