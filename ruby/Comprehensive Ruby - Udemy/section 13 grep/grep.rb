# grep return new arr with result
arr = [1, 3, 200, 1, 2, 31]
arr.grep(1)

arr2 = ['hey.rb', 'there.rb', 'index.html']
j = []
# arr2.each { |i| j << i.split('.')[0] }
arr2.each { |i| i.split('.')[1] == 'rb' ? j << i.split('.')[0] : j }

# grep to do the same thing
arr2.grep(/(.*)\.rb/) { Regexp.last_match }

p j
