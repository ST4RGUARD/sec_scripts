require 'rubygems'
require 'httparty'

class EdutechionalResty
  include HTTParty
  base_uri 'edutechional-resty.herokuapp.com/'

  def posts
    self.class.get('/posts.json')
  end
end

edutechional_resty = EdutechionalResty.new
edutechional_resty.posts.each do |post|
  p "Title: #{post['title']}"
end

response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')

response.code
response.body
response.message
p response.headers.inspect

class StackExchange
  include HTTParty
  base_uri 'api.stackexchange.com'

  def initialize(service, _page)
    @options = { query: { site: service } }
  end

  def questions
    self.class.get('/2.2/questions', @options)
  end

  def users
    self.class.get('/2.2/users', @options)
  end
end

stackexchange = StackExchange.new('stackoverflow', 1)
p stackexchange.questions
p stackexchange.users
