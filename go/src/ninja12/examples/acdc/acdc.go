package acdc

// Sum adds unlim value of type int
func Sum(xi ...int) int {
	s := 0
	for _, v := range xi {
		s += v
	}
	return s
}
