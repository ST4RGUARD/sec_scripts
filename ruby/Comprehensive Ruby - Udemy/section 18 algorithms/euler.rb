require 'prime'
require 'humanize'
require 'date'
# Prime
prime_array = Prime.take_while { |p| p < 2_000_000 }

total_count = prime_array.inject { |sum, x| sum + x }

p total_count

# Power Digit Sum
# pwr = p(2**1000)

# sum = pwr.to_s.split('').inject { |x, y| p x.to_i + y.to_i }
# p sum

# p (2 ** 1000).to_s.split(//).map(&:to_i).inject(:+)

# Humanize
p (1..1000).to_a.map(&:humanize).map { |x| x.delete(' ').delete('-') }.map(&:size).inject(:+)

# Count Sundays
# start_date = Time.local(1901)
# end_date = Time.local(2000, 12, 31)
# sunday_counter = 0

# while end_date >= start_date
#   sunday_counter += 1 if end_date.strftime('%A') == 'Sunday' && end_date.strftime('%d') == '01'
#   end_date -= 86_400
# end

# p sunday_counter

# 1000 digit Fibonacci number
# Fn = Fn-1 + Fn-2  F1 = 1 . F2 = 1

def fib_digit_counter
  num1 = -1
  num2 = 0
  i = 1

  while i.to_s.length < 1000
    num1 += 1
    pre_i = i
    i = num2
    p i
    num2 += pre_i
  end
  num1
end

# p fib_digit_counter

# Lexicographic Permutations
# p Array((0..9)).permutation.to_a[999_999].join

# Factorials n! = n*(n-1)*(n-1).. 10! = 3628800 , find sum of factorial answer i.e 3+6+2+8+8+0+0

# n = 100
# ans = 100
# while n > 1
#   ans *= (n - 1)
#   n -= 1
# end

# p ans.to_s.split('').map(&:to_i).inject(:+)

# Fibonacci even nums 1,2,3,5,8...
# def fib_digit_counter_even(count)
#   num1 = -1
#   num2 = 0
#   i = 1
#   sum = 0

#   while i < count
#     sum += i if i.even?
#     num1 += 1
#     pre_i = i
#     i = num2
#     num2 += pre_i
#   end
#   p sum
# end

# p fib_digit_counter_even(4_000_000)

# Least Common Multiple - smallest positive num evenly divisible by all of numbers from 1 to 20
(1..20).to_a.reduce(:lcm)
