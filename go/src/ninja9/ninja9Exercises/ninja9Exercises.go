package main

import (
	"fmt"
	"math"
	"runtime"
	"sync"
	"sync/atomic"
)

var wg sync.WaitGroup

type person struct {
	First string
	Last  string
	Age   int
}

func (s *person) speak() {
	fmt.Println("i am ", s.First, s.Last, " - the person - ", s.Age, "years old")
}

type human interface {
	speak()
}
type circle struct {
	radius float64
}
type shape interface {
	area() float64
}

func (c *circle) area() float64 {
	return math.Pi * c.radius * c.radius
}

func info(s shape) {
	fmt.Println("area", s.area())
}

func foo() {

	fmt.Println(runtime.NumCPU())
	fmt.Println(runtime.NumGoroutine())
	for i := 0; i < 10; i++ {
		fmt.Println("i:", i)
	}

	fmt.Println("finished foo")
	wg.Done()
}

func bar() {

	fmt.Println(runtime.NumCPU())
	fmt.Println(runtime.NumGoroutine())
	for i := 0; i < 10; i++ {
		fmt.Println("foo:", i)
	}

	fmt.Println("finished bar")
	wg.Done()

}

func exercise2b(h human) {
	h.speak()
}

func exercise1() {
	wg.Add(2)
	go foo()

	go bar()
	wg.Wait()
	fmt.Println("--------")
}

func exercise2a() {
	c := circle{5}
	//info(c)
	info(&c)
	//fmt.Println(c.area())
	fmt.Println("--------")
}

func exercise3() {
	fmt.Println("RACE")
	fmt.Println("--------")
	fmt.Println("CPUs:", runtime.NumCPU())
	fmt.Println("Goroutines:", runtime.NumGoroutine())
	counter := 0
	const gs = 100

	var wg sync.WaitGroup
	wg.Add(gs)
	var mu sync.Mutex // mutex used to fix race condition exercise4
	for i := 0; i < gs; i++ {
		go func() {
			mu.Lock()
			v := counter
			//Gosched()?
			runtime.Gosched()
			v++
			counter = v
			fmt.Println(counter)
			mu.Unlock()
			wg.Done()
		}()
	}
	wg.Wait()
	fmt.Println("Goroutines:", runtime.NumGoroutine())
	fmt.Println("counter:", counter)
	fmt.Println("--------")
}

func exercise5() {
	var counter int64
	const gs = 100

	var wg sync.WaitGroup
	wg.Add(gs)
	//var mu sync.Mutex // mutex used to fix race condition exercise4
	for i := 0; i < gs; i++ {
		go func() {
			atomic.AddInt64(&counter, 1)
			fmt.Println("ex5 Counter: ", atomic.LoadInt64(&counter))
			wg.Done()
		}()
	}
	wg.Wait()
	fmt.Println("End counter:", counter)
	fmt.Println("--------")
}

func exercise6() {
	fmt.Println("OS", runtime.GOOS)
	fmt.Println("ARCH", runtime.GOARCH)
	fmt.Println("CPUS", runtime.NumCPU())
	fmt.Println("GOROUTINES", runtime.NumGoroutine())
	fmt.Println("--------")
}

func main() {
	p1 := person{First: "J", Last: "Rel", Age: 20}
	exercise1()
	exercise2a()
	exercise2b(&p1)
	exercise3()
	exercise5()
	exercise6()
}
