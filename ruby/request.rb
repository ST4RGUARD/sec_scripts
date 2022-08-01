#!/usr/bin/ruby
# send a POST/data to an ip address/port
require 'socket'
require 'uri'
require 'net/http'
require 'openssl'
#
# buf = ''
# num = rand(25-100) + 25
# index = rand(num)
#
# num.times do
#   alpha = rand(127-7) + 7
#   buf += alpha.chr
# end
#
# buffer = "GET /api/v1/auth/login" + buf
# puts buffer
#
# s = UDPSocket.new
# s.send(buffer,0,"10.218.207.183",80)

uri = URI.parse('https://10.218.207.183')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
request = Net::HTTP::Post.new('/api/v1/auth/login')
request.body = { 'credentials' => { 'username' => '"><h1>hi</h1>', 'password' => 'key' } }
response = http.request(request)

puts response.code
puts response.body
