# # check out rubular
# str = 'the quick 12 brown foxes jumped over the 10 lazy dogs'

# p str =~ /quick/

# # ternary if else
# p str =~ /z/ ? 'Valid' : 'Invalid'

# # no uppercase Z
# p str =~ /Z/ ? 'Valid' : 'Invalid'

# # case insensitive
# p str =~ /Z/i ? 'Valid' : 'Invalid'

# p str.to_enum(:scan, /\d+/).map { Regexp.last_match }

# VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

# def valid_email?(email)
#   email =~ VALID_EMAIL_REGEX
# end

# p valid_email?('jabomb@bomb.com') ? 'Valid' : 'Invalid'
# p valid_email?('jabombbomb.com') ? 'Valid' : 'Invalid'
# p valid_email?('jabomb@bomb') ? 'Valid' : 'Invalid'

# # 172.16.0.0 to 172.31.255.255
# IP_ADDR_REGEX = /^((?:(?:^|\.)(?:\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])){4})$/

# def valid_ip_address?(ip)
#   ip =~ IP_ADDR_REGEX
# end

# p valid_ip_address?('172.168.1.121') ? 'Valid' : 'Invalid'
# p valid_ip_address?('172.22.254.255') ? 'Valid' : 'Invalid'
# p valid_ip_address?('172.16.128.255') ? 'Valid' : 'Invalid'


# wheel of fortune
starting_sentence = 'hi from matching land'
sentence_array = starting_sentence.split('').map(&:downcase)
accurate_count = sentence_array - [' ']
final_sentence = starting_sentence.gsub(/[a-zA-Z]/, '_').split('')
while sentence_array.count('') < accurate_count.count
  puts 'Guess a letter:'
  guess = gets.downcase.chomp
  if sentence_array.include?(guess)
    letter_index = sentence_array.find_index(guess)
    sentence_array[letter_index] = ''
    final_sentence[letter_index] = guess
    puts "correct! the sentence is now : #{final_sentence.join}"
  else
    puts 'sorry that letter is incorrect, plz try again'
  end
end
