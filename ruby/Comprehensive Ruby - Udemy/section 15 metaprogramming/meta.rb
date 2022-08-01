require 'ostruct'

# Author class showing dynamic method creation
class Author
  attr_accessor :first_name, :last_name, :genre

  def author
    OpenStruct.new(first_name: first_name, last_name: last_name, genre: genre)
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s =~ /author_(.*)/
      author.send(Regexp.last_match(1), *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?('author') || super
  end
end

author = Author.new
author.first_name = 'ja'
author.last_name = 'rel'
author.genre = 'gaming'

p author.first_name
p author.author_genre
p author.respond_to?(:author_genre)

# original Baseball class
class Baseball
end

# override existing Baseball class
class Baseball
  def swing
    'homerun'
  end
end

# override core ruby String class
class String
  def censor(bad_word)
    gsub! bad_word.to_s, 'CENSORED'
  end

  def num_of_chars
    size
  end
end

p Baseball.new.swing

p 'The dog was destroying his dog friend'.censor('dog')
p 'this is another one to test new string class.'.num_of_chars

class Writer
  define_method('some_method') do
    puts 'some details'
  end

  # same as below
  def some_method
    puts 'more details'
  end

  def fiction_details(arg)
    puts 'Fiction'
    puts arg
  end

  def coding_details(arg)
    puts 'Coding'
    puts arg
  end

  def history_details(arg)
    puts 'History'
    puts arg
  end
end

writer = Writer.new
writer.some_method

# better implementation not having to repeat code with define_method
class Writer
  genres = %w[Fiction Coding History]

  genres.each do |genre|
    define_method("#{genre}_details") do |arg|
      puts "Genre: #{genre}"
      puts arg
      puts genre.object_id
    end
  end
end

writer = Writer.new
writer.coding_details('jim john')
writer.fiction_details('fiction man')
# creates method and respond_to - use define_method if know method names
p writer.respond_to?(:coding_details)
