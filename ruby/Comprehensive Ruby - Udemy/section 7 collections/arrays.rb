j = [12,3,4,3242]
p j.class

arr = Array.new(10)
p arr

1.upto(20) do |i|
  i += 1
end

arr.collect{|x| p x.class}

x = [2,4,"joi",true,44,4,20930,"fjwo"]

# delete
x.delete(4)
p x
x.delete_at(2)
p x

# delete_if
j.delete_if {|j| j < 10}

let = ["a", "b", "c", "me"]
# join
let.join("-")

# push pop
teams = ["team1", "team2","team3"]
teams.push("team4","team5")
teams.pop


