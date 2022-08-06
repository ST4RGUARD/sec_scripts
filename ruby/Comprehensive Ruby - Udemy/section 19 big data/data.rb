require 'rubygems'
require 'decisiontree'

attr = ['Temp']
training = [
  [98.7, 'healthy'],
  [99.1, 'healthy'],
  [99.5, 'sick'],
  [100.5, 'sick'],
  [102.5, 'crazy sick'],
  [107.5, 'dead']
]

dec_tree = DecisionTree::ID3Tree.new(attr, training, 'sick', :continuous)
dec_tree.train

test = [107.5, 'healthy']
decision = dec_tree.predict(test)

puts "prediction: #{decision}"
puts "reality: #{test.last}"

# example

attributes = ['Age', 'Education', 'Income', 'Marital Status']
training = [
  ['36-55', 'Masters', 'High', 'Single', 1],
  ['18-35', 'High School', 'Low', 'Single', 0],
  ['18-35', 'PhD', 'High', 'Married', 1],
  ['55+', 'High School', 'High', 'Married', 1],
  ['< 18', 'High School', 'High', 'Married', 1],
  ['< 18', 'Masters', 'Low', 'Single', 0]
]

dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :discrete)
dec_tree.train

test = ['< 18', 'High School', 'High', 'Married']
test2 = ['18-35', 'High School', 'Low', 'Single']
decision = dec_tree.predict(test)
decision2 = dec_tree.predict(test2)

puts "Predicted: #{decision2}"
