
position = {first_base: "jim john", second_base: "jose altuve"}
p position
#position = {"first_base" => "jim job", "second_base" => "jose smose"}

# works for first syntax
position[:second_base]

# works for second syntax
position["first_base"]

position[:second_base]
# delete operates on hash in place
# position.delete(:first_base)

# iterate over hash
# if just want key or value 
position.each_key do |key|
  key
end

position.each do |k,v|
  return k,v
end

ppl = {me: 37, you: 32, them: 18}
ppl2 = ppl.invert

ppl = ppl.merge(ppl2)
puts ppl

p ppl.keys
p ppl.values