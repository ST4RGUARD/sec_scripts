name = "memaw"

greeting = "hello #{name}"
puts greeting

str = "The quick brown fox jumped over the quick dog"

p str.sub "quick", "slow" # sub first
p str.gsub "quick", "slow" # sub global / all

p str # doens't change initial assignment var need to add gsub!

p str.strip
p str.split # converts to an array