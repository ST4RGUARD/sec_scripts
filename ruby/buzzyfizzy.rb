for i in 1..100
  print("#{i}:")
  if i % 5 == 0 && i % 3 == 0
    puts("fizzbuzz")
  elsif i % 3 == 0
    puts("fizz")
  elsif i % 5 == 0
    puts("buzz")
  end
end

1.upto(100) do |num|
  puts(num.to_s)
  if num % 15 == 0
    puts("fizzbuzz")
  elsif num % 3 == 0
    puts("fizz")
  elsif num % 5 == 0
    puts("buzz")
  end
end

(1..100).each do |num|
  puts(
    num.to_s +
      " : " +
      (if num % 15 == 0
        "fizzbuzz"
      else
        (if num % 3 == 0
          "fizz"
        else
          (num % 5 == 0 ? "buzz" : "")
        end)
      end)
  )
end

1.upto(100) do |num|
  puts(
    num.to_s +
      " : " +
      (if num % 15 == 0
        "fizzbuzz"
      else
        (if num % 3 == 0
          "fizz"
        else
          (num % 5 == 0 ? "buzz" : "")
        end)
      end)
  )
end

1.step(100, 1) do |num|
  puts(
    num.to_s +
      " : " +
      (if num % 15 == 0
        "fizzbuzz"
      else
        (if num % 3 == 0
          "fizz"
        else
          (num % 5 == 0 ? "buzz" : "")
        end)
      end)
  )
end
