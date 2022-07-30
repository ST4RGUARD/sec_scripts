
# while
i = 0
while i < 10
    puts "yo - #{i}"
    i += 1
end

# each
arr = [20,30,1,3]

arr.each {|ele| puts ele}

arr.each do |ele|
  puts ele
end

# for
for i in arr
  p i
end

# nested iterators
teams = { 
  "Houston Astros" => { 
    "first-base" => "chris carter",
    "second-base" => "jose altuve"
  },
  "Texas Rangers" => { 
    "first base" => "prince guy",
    "second base" => "r, orde"
   }
 }

 puts "the teams are"
teams.each do|team, players| 
  puts team
  players.each do |position, player|
    puts "#{player} plays #{position}"
  end 
end

# given araray of int
# only grab the evn int

arr = [2,5,8,10,33,40]

arr.each {|int| puts int if int % 2 == 0}
arr2 = arr.select {|int| int.even?}
arr3 = (1..10).select(&:even?)
p arr2
p arr3

words = %w(this is a long sentence not really a sentence but i want to see all of the words that are going to be over four letters)
words.select {|x| p x if x.length > 4}

['a', 'b', 'c', 'e', 'i'].select{|v| p v if v =~ /[aeiou]/ } 

# map
["1","23.0","0","4"].map {|x| x.to_i}

["1","23.0","0","4"].map(&:to_i)

("a".."g").to_a.map{|i| i*2}
Hash[[1,2.1,3.33,0.9].map{|x|[x,x.to_i]}]

# inject + * methods
total = 0
[3,2,4,50,2,20020].each do |i|
  total += i
end

p [3,2,4,50,2,20020].inject(&:+)
