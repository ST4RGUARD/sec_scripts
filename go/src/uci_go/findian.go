
package main

import (
	"fmt"
	"strings"
	"os"
	"bufio"
)

func findian() {
	var beg,mid,end = false, false, false
	// bc we can accept string with spaces can't use Scan	
	reader := bufio.NewReader(os.Stdin)
  fmt.Println("Enter String:")
  ian, _ := reader.ReadString('\n')
  ian = strings.TrimSpace(ian)

	if strings.HasPrefix(ian, "i") || strings.HasPrefix(ian, "I") {
		beg = true
  } 
	if ian[len(ian)-1] == 'n' || ian[len(ian)-1] == 'N' {
		end = true
  } 
	if beg == true && end == true && (strings.Contains(ian, "a") || strings.Contains(ian, "A")) {
		mid = true
  }

	if beg && mid && end {
		fmt.Println("Found!")
	} else {
		fmt.Println("Not Found!")
  }
}

func main() {
	findian()
}
