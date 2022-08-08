a1 = %i[first second third fourth]  # => [:first, :second, :third, :fourth]
a2 = [:before, a1, :after]               # => [:before, [:first, :second, :third, :fourth], :after]
a2.flatten                               # => [:before, :first, :second, :third, :fourth, :after]
a2 = [:before, *a1, :after]              # => [:before, :first, :second, :third, :fourth, :after]
# destructuring - using splat

x = 1
y = 2
z = 3 # => [1, 2, 3]

x, y, z = *a1 # => [:first, :second, :third, :fourth]
x            # => :first
y            # => :second
z            # => :third

*x, y, z = *a1      # => [:first, :second, :third, :fourth]
x                   # => [:first, :second]
y                   # => :third
z                   # => :fourth
x, *y, z = *a1      # => [:first, :second, :third, :fourth]
x                   # => :first
y                   # => [:second, :third]
z                   # => :fourth
x, y, *z = *a1      # => [:first, :second, :third, :fourth]
x                   # => :first
y                   # => :second
z                   # => [:third, :fourth]
first, *rest = *a1  # => [:first, :second, :third, :fourth]
first               # => :first
rest                # => [:second, :third, :fourth]
*first, last = *a1  # => [:first, :second, :third, :fourth]
first               # => [:first, :second, :third]
last                # => :fourth

def sum3(x, y, z)
  x + y + z # => 180
end # => :sum3
triangle = [90, 60, 30] # => [90, 60, 30]
sum3(*triangle) # => 180

# slurp
def greet(greeting, *names)
  names.each do |name| # => ["poop", "olewhatshisface", "stain"]
    puts "#{greeting}, #{name}" # => nil, nil, nil
  end # => ["poop", "olewhatshisface", "stain"]
end # => :greet

greet('heello', 'poop', 'olewhatshisface', 'stain') # => ["poop", "olewhatshisface", "stain"]

h = {
  orange: :juice, # => :juice
  apple: :cider,     # => :cider
  lemon: :lemondade  # => :lemondade
}                       # => {:orange=>:juice, :apple=>:cider, :lemon=>:lemondade}
h.each do |arg|         # => {:orange=>:juice, :apple=>:cider, :lemon=>:lemondade}
  puts arg.inspect # => nil, nil, nil
end # => {:orange=>:juice, :apple=>:cider, :lemon=>:lemondade}

# destructuring using groups
expr = [:*, 3, [:+, 2, 5]] # => [:*, 3, [:+, 2, 5]]

op, f1, f2 = expr      # => [:*, 3, [:+, 2, 5]]
inner_op, t1, t2 = f2  # => [:+, 2, 5]
op                     # => :*
f1                     # => 3
f2                     # => [:+, 2, 5]
inner_op               # => :+
t1                     # => 2
t2                     # => 5

# mirroring structure
op, f1, (inner_op, t1, t2) = expr  # => [:*, 3, [:+, 2, 5]]
op                                 # => :*
f1                                 # => 3
inner_op                           # => :+
t1                                 # => 2
t2                                 # => 5

expr = [:*, 3, [:+, 2, 5, 7]]      # => [:*, 3, [:+, 2, 5, 7]]
op, f1, (inner_op, *ts) = expr  # => [:*, 3, [:+, 2, 5, 7]]
ts                              # => [2, 5, 7]

menu = {
  'turkey' => '$7.25', # => "$7.25"
  'mikey' => '$7.25', # => "$7.25"
  'cheese' => '$5.25' # => "$5.25"
}                                # => {"turkey"=>"$7.25", "mikey"=>"$7.25", "cheese"=>"$5.25"}
menu.each_with_index do |*args|  # => {"turkey"=>"$7.25", "mikey"=>"$7.25", "cheese"=>"$5.25"}
  puts args.inspect # => nil, nil, nil
end # => {"turkey"=>"$7.25", "mikey"=>"$7.25", "cheese"=>"$5.25"}

menu.each_with_index do |pair, i| # => {"turkey"=>"$7.25", "mikey"=>"$7.25", "cheese"=>"$5.25"}
  name, price = pair # => ["turkey", "$7.25"], ["mikey", "$7.25"], ["cheese", "$5.25"]
  puts "#{i + 1}: #{name} (#{price})" # => nil,                 nil,                nil
end # => {"turkey"=>"$7.25", "mikey"=>"$7.25", "cheese"=>"$5.25"}

menu.each_with_index do |(name, price), i| # => {"turkey"=>"$7.25", "mikey"=>"$7.25", "cheese"=>"$5.25"}
  puts "#{i + 1}: #{name} (#{price})" # => nil, nil, nil
end # => {"turkey"=>"$7.25", "mikey"=>"$7.25", "cheese"=>"$5.25"}

# >> heello, poop
# >> heello, olewhatshisface
# >> heello, stain
# >> [:orange, :juice]
# >> [:apple, :cider]
# >> [:lemon, :lemondade]
# >> [["turkey", "$7.25"], 0]
# >> [["mikey", "$7.25"], 1]
# >> [["cheese", "$5.25"], 2]
# >> 1: turkey ($7.25)
# >> 2: mikey ($7.25)
# >> 3: cheese ($5.25)
# >> 1: turkey ($7.25)
# >> 2: mikey ($7.25)
# >> 3: cheese ($5.25)
