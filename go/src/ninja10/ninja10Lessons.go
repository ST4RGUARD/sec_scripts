package main

import (
	"context"
	"fmt"
	"math/rand"
	"runtime"
	"sync"
	"time"
)

func deadlock() {
	c := make(chan int)

	c <- 42
	fmt.Println(<-c)
}

func passChan() {
	c := make(chan int)

	go func() {
		c <- 42
	}()
	fmt.Println(<-c)
}

func bufferChan() {
	c := make(chan int, 1)

	c <- 42

	fmt.Println(<-c)
}

func unsuccBuffer() {
	c := make(chan int, 1)

	c <- 42
	//only made room for 1
	c <- 43

	fmt.Println(<-c)
}

func dirChan() {
	//send only channel
	//c := make(chan<- int, 2)
	//rcv only channel
	c := make(<-chan int, 2)

	go func() {
		fmt.Println(<-c)
	}()

	fmt.Println(<-c)
	fmt.Println("----")
	fmt.Printf("%T\n", c)
}

func chanEx() {
	c := make(chan int)

	//send only channel
	go foo(c)

	//receive channel
	bar(c)

	fmt.Println("about to exit")
}

func foo(c chan<- int) {
	for i := 0; i < 100; i++ {
		c <- i
	}
	close(c)
}

func bar(c <-chan int) {
	for v := range c {
		fmt.Println(v)
	}
}

func selectChan() {
	even := make(chan int)
	odd := make(chan int)
	quit := make(chan int)

	//send only channel
	go send(even, odd, quit)

	rcv(even, odd, quit)
}

func rcv(e, o, q <-chan int) {
	for {
		select {
		case v := <-e:
			fmt.Println("even channel: ", v)
		case v := <-o:
			fmt.Println("odd channel: ", v)
		case v := <-q:
			fmt.Println("quit channel: ", v)
			return
		}
	}
}

func send(e, o, q chan<- int) {
	for i := 0; i < 100; i++ {
		if i%2 == 0 {
			e <- i
		} else {
			o <- i
		}
	}
	q <- 0
}

func sendIN(e, o chan<- int) {
	for i := 0; i < 10; i++ {
		if i%2 == 0 {
			e <- i
		} else {
			o <- i
		}
	}
	close(e)
	close(o)
}

func rcvIN(e, o <-chan int, fanin chan<- int) {
	var wg sync.WaitGroup
	wg.Add(2)

	go func() {
		for v := range e {
			fanin <- v
		}
		wg.Done()
	}()

	go func() {
		for v := range o {
			fanin <- v
		}
		wg.Done()
	}()

	wg.Wait()
	close(fanin)
}

func commaOK() {
	c := make(chan int)
	go func() {
		c <- 42
		close(c)
	}()

	v, ok := <-c
	fmt.Println(v, ok)
	v, ok = <-c
	fmt.Println(v, ok)
}

func fanIN() {
	even := make(chan int)
	odd := make(chan int)
	fanin := make(chan int)

	//send only channel
	go sendIN(even, odd)

	go rcv(even, odd, fanin)
}

func populate(c chan int) {
	for i := 0; i < 100; i++ {
		c <- i
	}
	close(c)
}

func fanOutIn(c1, c2 chan int) {
	var wg sync.WaitGroup
	for v := range c1 {
		wg.Add(1)
		go func(v2 int) {
			c2 <- timeConsumingWork(v2)
			wg.Done()
		}(v)
	}
	wg.Wait()
	close(c2)
}

func timeConsumingWork(n int) int {
	time.Sleep(time.Microsecond * time.Duration(rand.Intn(500)))
	return n + rand.Intn(1000)
}

func fanOUT() {
	c1 := make(chan int)
	c2 := make(chan int)

	go populate(c1)

	go fanOutIn(c1, c2)

	for v := range c2 {
		fmt.Println("yo", v)
	}

	fmt.Println("about to exit")
}

//context help make sure no orphaned go routines exist

func contextStuff() {
	ctx, cancel := context.WithCancel(context.Background())

	fmt.Println("err check 1:", ctx.Err())
	fmt.Println("num goroutines 1:", runtime.NumGoroutine())

	go func() {
		n := 0
		for {
			select {
			case <-ctx.Done():
				return
			default:
				n++
				time.Sleep(time.Millisecond * 200)
				fmt.Println("working", n)
			}
		}
	}()

	time.Sleep(time.Second * 2)
	fmt.Println("error check 2:", ctx.Err())
	fmt.Println("num goroutines 2:", runtime.NumGoroutine())
	fmt.Println("about to cancel context")
	cancel()
	fmt.Println("canceled context")

	time.Sleep(time.Second * 2)
	fmt.Println("error check 3:", ctx.Err())
	fmt.Println("num goroutines 3:", runtime.NumGoroutine())
}

func main() {
	//deadlock()
	//passChan()
	//bufferChan()
	//unsuccBuffer()
	//dirChan()
	//chanEx()
	//selectChan()
	//commaOK()
	//fanIN()
	//fanOUT()
	contextStuff()
}
