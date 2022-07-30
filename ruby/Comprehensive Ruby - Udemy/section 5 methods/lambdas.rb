first_name = lambda {|first, last| first + " " + last}
occupation = ->(job) {job + " career"}
p first_name["jim", "bo"]
p occupation["poopoo"]

# lambda counts arguments and throws error
full_name = lambda {|first, last| first + " " + last}
#p full_name.call("jim", "bob","mcgee")

p "hello"

#full_name = Proc.new {|first, last| first + " " + last}
#p full_name.call("jim", "bob","mcgee")

# Return behavior
# for lambda exits lambda block when return but continues to execute inside method
# def my_method
#     x = lambda{return}
#     x.call
#     p "text from within method"
# end

# my_method
# for Proc will exit method when return is hit skipping method contents
def my_method
    x = Proc.new {return}
    x.call
    p "text from within method"
end

my_method

# kwargs
def registration(email:, password:, **kwargs)
    puts "building account for : #{email}"

    if kwargs[:role]
        puts "with role: #{kwargs[:role]}"
    end
end

registration(email: "blah@blah.com", password: "poo")