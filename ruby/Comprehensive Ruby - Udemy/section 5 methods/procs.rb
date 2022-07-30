full_name = Proc.new {|first, last| first + " " + last}
p full_name["jim", "bo"]
p full_name.call("jim","bo")