for i in 1..100 do
  print "#{i.to_s}:"
  if i % 5 == 0 && i % 3 == 0
    puts "fizzbuzz"
  elsif i % 3 == 0
    puts "fizz"
  elsif i % 5 == 0
    puts "buzz"
  end
end

1.upto(100) do |num|
  puts num.to_s
  if num % 15 == 0
    puts "fizzbuzz"
  elsif num % 3 == 0
    puts "fizz"
  elsif num % 5 == 0
    puts "buzz"
  end
end

(1..100).each{|num| puts num.to_s + " : " + (num % 15 == 0 ? "fizzbuzz" : (num % 3 == 0 ? "fizz" : (num % 5 == 0 ? "buzz" : "")))}

1.upto(100) {|num| puts num.to_s + " : " + (num % 15 == 0 ? "fizzbuzz" : (num % 3 == 0 ? "fizz" : (num % 5 == 0 ? "buzz" : "")))}

1.step(100,1) {|num| puts num.to_s + " : " + (num % 15 == 0 ? "fizzbuzz" : (num % 3 == 0 ? "fizz" : (num % 5 == 0 ? "buzz" : "")))}

