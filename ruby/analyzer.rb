#!/usr/bin/ruby
class Text
  attr_accessor :input

  def help
    puts 'for user input'
    puts '-u "user input"'
    puts 'for file input'
    puts '-f "/path/to/file"'
    exit
  end

  def user_input
      case ARGV[0]
        when "-h"
          help()
        when "-u"
          @input = ARGV[1]
        when "-f"
          begin
            @input = File.open("#{ARGV[1]}","r"){|x|x.readlines}
            @input = @input.map {|s| "#{s}" }.join(' ')
          rescue Exception => e
            puts e.message
            exit
          end
        else
          puts "input error see help -h"
          exit
      end
  end

  def characters
      char_cnt = @input.length
      char_without_spaces = @input.delete(' ').length
      puts "There are #{char_cnt} characters in your data"
      puts "There are #{char_without_spaces} characters without spaces in your data"
  end

  def lines
    linecnt = @input.split("\n").length
    puts linecnt.inspect
    puts "There are #{linecnt} lines in your data"
  end

  def words
    word_cnt = []
    words = @input.split(' ').each{|word| word_cnt<<word.length}
    words = word_cnt.inject(:+)
    puts "There are #{words} words in your data"
  end

  def averages
    # create sentences based on punctuation
    @sentence_cnt  = @input.split(/[?,!,.]/)
    @paragraph_cnt = @input.split("\n")

    avg_words_per_sentence = lambda {
                            words = @sentence_cnt.map{|word| word.split(' ')}
                            num = []
                            words.each{|word|num<<word.length}
                            num.inject(:+) / @sentence_cnt.length
                          }

    avg_sentence_per_block = lambda {
                            sentences = @paragraph_cnt.map{|sentence| sentence.split('.')}
                            num = []
                            sentences.each{|sentence|num<<sentence.length}
                            num.inject(:+) / @paragraph_cnt.length
                          }
    puts "There are #{@sentence_cnt.length} sentences in your data"
    puts "There are #{@paragraph_cnt.length} paragraphs in your data"
    puts "There is an average of #{avg_words_per_sentence.call} words per sentence in your data"
    puts "There is an average of #{avg_sentence_per_block.call} sentences per paragraph in your data"
  end
end

text = Text.new
text.user_input
text.characters
text.lines
text.words
text.averages
