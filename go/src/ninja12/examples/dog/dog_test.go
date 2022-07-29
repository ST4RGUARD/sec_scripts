package dog

import (
	"fmt"
	"testing"
)

func TestYears(t *testing.T) {

	type test struct {
		years   int
		answer int
	}

	tests := []test{
		test{10, 70},
		test{3, 21},
		test{1, 7},
	}

	for _, v := range tests {
		x := Years(v.years)
		if x != v.answer {
			t.Error("Expected", v.answer, "Got", x)
		}
	}

}

func TestYearsTwo(t *testing.T) {

	type test struct {
		years   int
		answer int
	}

	tests := []test{
		test{10, 70},
		test{3, 21},
		test{1, 7},
	}

	for _, v := range tests {
		x := YearsTwo(v.years)
		if x != v.answer {
			t.Error("Expected", v.answer, "Got", x)
		}
	}

}

func ExampleYears() {
	fmt.Println(Years(10))
	// Output: 70
}



func BenchmarkYears(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Years(10)
	}
}

func BenchmarkYearsTwo(b *testing.B) {
	for i := 0; i < b.N; i++ {
		YearsTwo(15)
	}
}

// for test coverage
// go test -cover
// go test -coverprofile c.out
// go tool cover -html=c.out
// godoc -http:=8080
