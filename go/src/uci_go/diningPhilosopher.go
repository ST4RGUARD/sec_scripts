package main

import (
	"fmt"
	"sync"
	"time"
)

type (
	ChopS struct{ sync.Mutex }
	Philo struct {
		id              int
		leftCS, rightCS *ChopS
	}
)

func (p *Philo) eat() {
	for i := 0; i < 3; i++ {
		if p.id == 5 {
			p.rightCS.Lock()
			p.leftCS.Lock()
		} else {
			p.leftCS.Lock()
			p.rightCS.Lock()
		}

		fmt.Printf("starting to eat %d\n", p.id)
		time.Sleep(200 * time.Millisecond)
		fmt.Printf("finished eating %d\n", p.id)

		p.leftCS.Unlock()
		p.rightCS.Unlock()
	}
}

func makeCS() []*ChopS {
	CSticks := make([]*ChopS, 5)
	for i := 0; i < 5; i++ {
		CSticks[i] = new(ChopS)
	}
	return CSticks
}

func makePhilo() []*Philo {
	philos := make([]*Philo, 5)
	cs := makeCS()
	for i := 0; i < 5; i++ {
		philos[i] = &Philo{
			id:      i + 1,
			leftCS:  cs[i],
			rightCS: cs[(i+1)%5],
		}
	}
	return philos
}

func host(philos []*Philo, wg *sync.WaitGroup) {
	defer wg.Done()
	sem := make(chan struct{}, 2)
	var eatWg sync.WaitGroup
	for _, p := range philos {
		eatWg.Add(1)
		go func(philo *Philo) {
			defer eatWg.Done()
			sem <- struct{}{}
			philo.eat()
			<-sem
		}(p)
	}
	eatWg.Wait()
}

func main() {
	var wg sync.WaitGroup
	philos := makePhilo()
	wg.Add(1)
	go host(philos, &wg)
	wg.Wait()
}
