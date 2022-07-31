# error reporting
begin
  puts nil + 10
rescue ZeroDivisionError => e
  puts "rescued the error #{e}"
end

# error logger

def error_logger(e)
  File.open('../../test.rb', 'a') do |file|
    file.puts e
  end
end

begin
  puts nil + 10
rescue StandardError => e
  error_logger("Error: #{e} at #{Time.now}")
end
