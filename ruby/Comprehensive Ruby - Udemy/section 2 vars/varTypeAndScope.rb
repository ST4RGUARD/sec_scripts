
# local vars
10.times do
    x = 10
    p x
end
# global vars
10.times do
    $x = 5
    p $x
end

p $x
# instance vars
@batting_avg = 300
# constants
TEAM = "stuff"

# Class vars
class MyClass
    @@teams = ["a's","tigers"]
end

