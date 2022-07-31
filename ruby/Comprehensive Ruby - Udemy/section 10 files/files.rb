# working with files
# writing to file
# File.open('../../test.rb', 'w+') { |f| f.write(' #comment here') }  # => 14

# r - reading
# a  - appending
# w  - writing
# w+ - reading and writing
# a+ - open for reading and appending
# r+ - open for updaing , both reading and writing
# also rb etc rubydocs

# save to file
file = File.new('../../test.rb', 'w+')
file.puts('# another comment replacing')
file.close

# read and operate on file
teams = File.read('../../test.rb')

p teams.split(' ')

# File.delte('../../test.rb')

# appending to file

# good example to show how relative path works with seeing_is_belieivng and saves to file
# vs vscode code run can't find file but doesn't error
10.times do
  sleep 1
  puts 'record saved...'
  File.open('../../test.rb', 'a') { |f| f.puts "server started at #{Time.new}" }
end
