x = 10
y = 5

# if else
if x == y
  puts "x is same as y"
else
  puts "not same"
end

nums = [1,3,5]

# unless
unless nums.empty?
  noms = nums.collect{|num| num+=1}
end
p noms
noms.each{|num| puts num unless num.odd?}

# multiple if else
if x == y
  puts "x is equal"
elsif x > y
  puts "x is greater"
elsif x < y
  puts "x is less than"
else
  puts "do not hit"
end

z = 10

if x ==y && x == z
  puts "x same as y and z"
elsif x ==z || x == y
  puts "x is same as 1"
end

unless false && false
  puts "Hey There"
end