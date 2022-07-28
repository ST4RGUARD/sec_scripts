package main

import (
	"fmt"
)

//get this deadlock code working
func exercise1() {
	c := make(chan int, 1)

	c <- 42 // deadlocked without buffer
	//func literal
	/* go func() {
		c <- 42
	}() */

	fmt.Println(<-c)
}

// get this code working
func exercise2() {
	cs := make(chan int)

	go func() {
		cs <- 42
	}()

	fmt.Println(<-cs)

	fmt.Printf("-------\n")
	fmt.Printf("cs\t%T\n", cs)
}

func gen() <-chan int {
	c := make(chan int)
	go func() {
		for i := 0; i < 10; i++ {
			c <- i
		}
		close(c)
	}()
	return c
}

func rcv(c <-chan int) {
	for v := range c {
		fmt.Println("num:", v)
	}
}

func rcvSelect(q, c <-chan int) {
	for {
		select {
		case v := <-q:
			fmt.Println(v)
			return
		case v := <-c:
			fmt.Println("odd channel: ", v)
			return
		}
	}
}

func send(q, c chan<- int) {
	for i := 0; i < 10; i++ {
		if i%2 == 0 {
			q <- i
		} else {
			c <- i
		}
	}
	q <- 0
}

func gen4(q chan<- int) <-chan int {
	c := make(chan int)

	go func() {
		for i := 0; i < 10; i++ {
			c <- i
		}
		close(c)
	}()
	return c
}

func exercise3() {
	c := gen()
	rcv(c)

	fmt.Println("about to exit")
}

// pull values using select
func exercise4() {
	q := make(chan int)
	c := gen4(q)

	rcvSelect(c, q)
	fmt.Println("about to exit")
}

func exercise5() {
	c := make(chan int)

	go func() {
		c <- 42
	}()

	v, ok := <-c
	fmt.Println(v, ok)

	close(c)

	v, ok = <-c
	fmt.Println(v, ok)
}

// puts 100 nums to channel and pulls them off channel and prints them
func exercise6() {
	nums := gen()
	rcv(nums)
}

func exercise7() {
	c := make(chan int)

	for i := 0; i < 10; i++ {
		go func() {
			for j := 0; j < 10; j++ {
				c <- j
			}
		}()
	}
	for k := 0; k < 100; k++ {
		fmt.Println(k, <-c)
	}
	fmt.Println("about to exit")
}

func main() {
	//exercise1()
	//exercise2()
	//exercise3()
	//exercise4()
	//exercise5()
	//exercise6()
	exercise7()
}
