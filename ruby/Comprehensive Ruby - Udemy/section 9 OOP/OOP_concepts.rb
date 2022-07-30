# class definition
class ApiConnector
  # getters and setters
  attr_accessor :title, :description, :url

  def initialize(title, description, url = "google.com")
    # method that happens whenever new class is created
    @title = title
    @description = description
    @url = url

    # proper way to call prviate method - secret_msg
  end

  def test_initializers
    puts @description
    puts @title
    puts @url
  end

  private
    def secret_msg
      puts "a secret msg"
    end

  def api_logger
    puts "api connector starting..."
  end
end

class SmsConnector < ApiConnector
  # classes have 1 responsibility
  # methods do 1 thing
  def send_sms
    puts "sending sms"
  end

  # polymorphism - overwriting parent class api_logger method
  def api_logger
    # to call parent class and run that method before this one
    super
    puts "..api connector starting...NOW"
  end
end

# instantiate new class 
# below fails with initialize method
# api = ApiConnector.new

# api = ApiConnector.new("My Title", "My desc")
api = ApiConnector.new("title", "description", url="yahoo.com")
sms = SmsConnector.new("title", "description")

api.url = 'http://google.com'

sms.send_sms
sms.api_logger  # => nil
# sms.secret_msg # improper way to call private method  # =>

api.test_initializers

# >> sending sms
# >> api connector starting...
# >> ..api connector starting...NOW
# >> description
# >> title
# >> http://google.com
