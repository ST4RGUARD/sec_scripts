res = nil
p res.nil?

def double(var)
  p var * 2
end

# access sys launch separate process
puts "backticks dd"
puts `date`
puts %x(date)
puts system "date"

double(2)
double("bye")