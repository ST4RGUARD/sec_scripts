package acdc

import (
	"fmt"
	"testing"
)

func ExampleSum() {
	fmt.Println(Sum(2, 3))
	// Output: 5
}

func BenchmarkSum(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Sum(2, 3)
	}
}

// for test coverage
// go test -cover
// go test -coverprofile c.out
// go tool cover -html=c.out
// godoc -http:=8080
