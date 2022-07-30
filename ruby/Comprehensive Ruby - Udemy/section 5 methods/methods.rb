
# puts vs return

def i_put
    puts "i print but my return is nil"
end

def i_return
    return "i don't print but i return"
end

i_put
x = i_return
puts x

class Invoice
    def self.print_out
      puts "printed invoice"
    end

    def convvert_to_pdf
       puts "converted to pdf"
    end
end

Invoice.print_out
i = Invoice.new
i.convvert_to_pdf
# i.method2
# i.method3

def full_name(first_name, last_name)
    first_name + " " + last_name
end

puts full_name("jim", "bobby")

def print_address city:, state:, zip:
    puts city
    puts state
    puts zip
end

print_address city: "murf", state: "tn", zip: "38209"

# override default args
def stream_movie title:, lang: "ENG"
  puts title
  puts lang
end

stream_movie title: "blah blah", lang: "FR" 

def customer_ass customer_1, customer_2, customer_3
  "Assigning: #{customer_1}, #{customer_2}, #{customer_3}"
end

customer_ass(
  "Apples",
  "Googles",
  "Facebooks"
)

# splat arg - returns array of strings
def customer_assignment *customers
  "Assigning: #{customers}"
end

customer_assignment(
  "Apple",
  "Google",
  "Facebook"
)