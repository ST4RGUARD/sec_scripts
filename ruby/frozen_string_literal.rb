# frozen_string_literal: false

# false - default, string not frozen different objec_id, can be modified
# true, string frozen same object_id when used throughout file , cannot be modified
3.times do
  p 'hello'.object_id
end
p 'world'.frozen?
p 'world'.object_id
p 'world'.object_id

str = ''
p str.object_id

1.upto(10) do |i|
  str << i
end

p str
