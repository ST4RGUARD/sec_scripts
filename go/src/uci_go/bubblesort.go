package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// prompt user to enter 10 int
// print int in 1 line least to greatest
func swap(nums []int, i int) {
	if nums[i] > nums[i+1] {
		tmp := nums[i]
		nums[i] = nums[i+1]
		nums[i+1] = tmp
	}
}

func bubbleSort(nums []int) {
	for i := 0; i < len(nums); i++ {
		// bc we are invoking i+1 in swap we need 1 less
		for j := 0; j < len(nums)-1-i; j++ {
			swap(nums, j)
		}
	}
}

func main() {
	nums := make([]int, 0, 10)
	fmt.Println("Enter up to 10 nums: ")
	scanner := bufio.NewScanner(os.Stdin)
	if scanner.Scan() {
		line := scanner.Text()
		fields := strings.Fields(line)
		for i, f := range fields {
			if i >= 10 {
				fmt.Println("Too many numbers")
				break
			}
			n, err := strconv.Atoi(f)
			if err != nil {
				fmt.Println("Invalid input:", f)
				continue
			}
			nums = append(nums, n)
		}
	}

	bubbleSort(nums)
	for i := 0; i < len(nums); i++ {
		fmt.Print(nums[i], " ")
	}
}
