num = 5
line = if num > 3 then "blah" else "poo" end

# only false and nil eval to false

# if not is same as unless

# ternary - condition ? do_this : else_do_this
# can work well for short statement but nothing complex

# +=  -=  ||= or equal

# ship ||= Spaceship.new - less verbose
# ship = Spaceship.new unless ship - create new ship unless if exists or true

# this doesn't work -undef var
# a || a = 10
# # if var doesn't exist it is assigned nil see below - doesn't work with bool
# a ||= 10
# b = 20 if false
#
# flag ||= true
# flag = false
# flag ||= true

# FLOW CONTROL

# || or vs && and
# and / or have much lower precedence than && / ||
# && higher precedence than ||
# and / or have the same precedence

# - use && || in conditional statements
# - use and or for flow control

# if engine.cut_out?
#   engine.restart or enable_emergency_power
# end
#
# if engine.cut_out?
#   enable_emergency_power unless engine.restart
# end

# begin, until, while
# begin end - execute at least once , like do - while
# begin
#   lightning.start_flashing
#   sound.play
# end while on_alert?
#
# begin
#   ship.accelerate
#   dosome.more_stuff
# end until ship.at_veloc?

# 1.upto(100) do |num|
#   puts "num = " + num.to_s
#   if num % 15 == 0
#     puts "fizzbuzz"
#   elsif num % 3 == 0
#     puts "fizz"
#   elsif num % 5 == 0
#     puts "buzz"
#   end
# end

# while msg = coms.get_msg
#   next if msg.type == "sync"
#   msg.process
# end

# while msg = coms.get_msg
#   msg.process
#   break if msg.type == "voice"
# end
#
# i = 0
# while i < 3
#   print "enter pos num: "   # <- redo starts back on this line w/o re-eval while
#   input = gets.to_i
#   redo if input <= 0
#   i += 1
# end

# for i in 1..100 do
#   puts "num=" + i.to_s
#   if i % 5 == 0 && i % 3 == 0
#     puts "fizzbuzz"
#   elsif i % 3 == 0
#     puts "fizz"
#   elsif i % 5 == 0
#     puts "buzz"
#   end
# end