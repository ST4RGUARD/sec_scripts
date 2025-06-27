package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
	"sync"
)

// sort array of ints
// partition array into 4 parts
// each part sorted by diff goroutine
// each partition arpprox equal size
// main goroutine should merge 4 sorted arrays into 1

func splitArray(input []int) ([]int, []int, []int, []int) {
	var mod, split_size int
	var sortAarr, sortBarr, sortCarr, sortDarr []int
	nums := input
	num_size := len(nums)

	split_size = num_size / 4
	mod = num_size % 4

	sizes := []int{split_size, split_size, split_size, split_size}
	for i := 0; i < mod; i++ {
		sizes[i] += 1
	}

	index := 0
	sortAarr = append(sortAarr, nums[index:index+sizes[0]]...)
	index += sizes[0]
	sortBarr = append(sortBarr, nums[index:index+sizes[1]]...)
	index += sizes[1]
	sortCarr = append(sortCarr, nums[index:index+sizes[2]]...)
	index += sizes[2]
	sortDarr = append(sortDarr, nums[index:index+sizes[3]]...)

	return sortAarr, sortBarr, sortCarr, sortDarr
}

func swap(nums []int, i int) {
	if nums[i] > nums[i+1] {
		tmp := nums[i]
		nums[i] = nums[i+1]
		nums[i+1] = tmp
	}
}

func sortA(sortAarr []int, wg *sync.WaitGroup) {
	arr := sortAarr
	for i := 0; i < len(arr); i++ {
		for j := 0; j < len(arr)-1-i; j++ {
			swap(arr, j)
		}
	}
	fmt.Printf("sortA sorting: %v\n", arr)
	wg.Done()
}

func sortB(sortBarr []int, wg *sync.WaitGroup) {
	arr := sortBarr
	for i := 0; i < len(arr); i++ {
		for j := 0; j < len(arr)-1-i; j++ {
			swap(arr, j)
		}
	}
	fmt.Printf("sortB sorting: %v\n", arr)
	wg.Done()
}

func sortC(sortCarr []int, wg *sync.WaitGroup) {
	arr := sortCarr
	for i := 0; i < len(arr); i++ {
		for j := 0; j < len(arr)-1-i; j++ {
			swap(arr, j)
		}
	}
	fmt.Printf("sortC sorting: %v\n", arr)
	wg.Done()
}

func sortD(sortDarr []int, wg *sync.WaitGroup) {
	arr := sortDarr
	for i := 0; i < len(arr); i++ {
		for j := 0; j < len(arr)-1-i; j++ {
			swap(arr, j)
		}
	}
	fmt.Printf("sortD sorting: %v\n", arr)
	wg.Done()
}

func mergeSorted(a, b []int) []int {
	sortedArr := make([]int, 0, len(a)+len(b))
	i, j := 0, 0

	for i < len(a) && j < len(b) {
		if a[i] < b[j] {
			sortedArr = append(sortedArr, a[i])
			i++
		} else {
			sortedArr = append(sortedArr, b[j])
			j++
		}
	}

	sortedArr = append(sortedArr, a[i:]...)
	sortedArr = append(sortedArr, b[j:]...)

	return sortedArr
}

func mergeArrays(arrays ...[]int) []int {
	merged := arrays[0]
	for i := 1; i < len(arrays); i++ {
		merged = mergeSorted(merged, arrays[i])
	}

	return merged
}

func getInput() []int {
	var input []int

	fmt.Println("Input integers: ")
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()
	line := scanner.Text()

	parts := strings.Fields(line)
	for _, part := range parts {
		num, err := strconv.Atoi(part)
		if err != nil {
			fmt.Println("Invalid number:", part)
			break
		}
		input = append(input, num)
	}
	return input
}

func main() {
	var wg sync.WaitGroup
	input := getInput()
	a, b, c, d := splitArray(input)
	wg.Add(1)
	go sortA(a, &wg)
	wg.Add(1)
	go sortB(b, &wg)
	wg.Add(1)
	go sortC(c, &wg)
	wg.Add(1)
	go sortD(d, &wg)
	wg.Wait()
	fmt.Printf("Sorted List: %v", mergeArrays(a, b, c, d))
}
