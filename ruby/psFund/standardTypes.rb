# encoding: US-ASCII
# overwrites encoding
#
# p 0x0F
#
# puts "str".encoding
#
# p %q['writes',some stuff is a str]
#
# p "abc" "def" # concat

# SYMBOLS
# arr = %i(up down left right)
# p arr
# # more efficient memory & performance wise
# "abc".to_sym
#
# # ARRAYS
# arr = []           # way to initialize
# arr = Array.new(3) # for specified # of elem
# arr = %i(up down left right)
#
# p arr[0..2]

# ENUMERABLES
# var = [1,2,3].map{|v| v * 10}
# p var
# var = [1,2,3].reduce(0) {|sum,v| sum + v}
# p var
# p [3,1,3].sort
# p [1,3,4,5,2,3].select {|n| n.even?}
# p [1,2,3,4,5].each_cons(2) {|v| p v}

# HASH
# h = {a: "a", b: "b"}
# h[:a]
#
# h.each{|v|p v}
# h.each{|k,v|p "#{k}  #{v}"}

# RANGES
# .. upper bound included
# ... upper not part of max
# (1..10).class
# (1..10).begin
# (1..10).end
# (1..10).include?(20)
# (1..10).map {|v| v*2}
# ("aa".."bb").each{|v|p v}

# PARALLEL ASSIGNMENT & SPLAT
# a,b = 1,2
# p a , b
# c = 1,2,3,4
# p c
#
# def get_values
#   [1,2,3,4]
# end
#
# a,b = get_values
# p a,b                           # grabs first 2 elem in get_values 2nd 2 are discarded
# first, _,_, last = get_values   # will ignore _ elem and grab first and last
# p first, last
#
# a,*b   = get_values               # a grabs 1 b will grab remainder of elems in array - SPLAT
# a,*b,c = get_values               # if SPLAT is not last it is greedy & leaves only enough elem for remaining vars
#
# r = (1..10)
# p [1,2,*r]
# h = {a: "a",b: "b",c: "c"}
# p [*h]