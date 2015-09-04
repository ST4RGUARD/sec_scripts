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

# EXCEPTIONS
# here rescues after batten_hatches, but light_sign could also throw errors so
# def launch
#   begin
#     batten_hatches
#   rescue
#     puts "couldn't batten"
#     false
#   end
#   light_sign
# end
# # do like this - launch will return false if error incurred for either method + prob is generic msg
# def launch
#   batten_hatches
#   light_sign
#   true
# rescue
#   puts "Exception intercepted"
#   false
# end
# if LightError came from StandardError and we define StdError first Light Error would never be triggered
# StdError would catch all exceptions including LightError
# def launch
#   batten_hatches
#   light_sign
#   true
# rescue LightError
#   puts "Lights not working still launch"
#   true
# rescue StandardError => e
#   puts e.message
#   false
# end
#
# # bad idea - bc will catch SignalException and SyntaxError
# begin
#   ship = Spaceship.new
#   ship.launch
# rescue Exception => e
#   puts e.message
#   puts e.backtrace
# end

# RAISE EXCEPTION

# don't put rtrn statement in ensure as any errors thrown in method will get swallowed by rtrn in ensure
# rtrn will execute instead

# def batten_hatches
#   hatch_file = File.open("hatches.txt")
#   # ..
#   raise HatchError, "Door Jammed" if door.jammed?
#   # ..
#   true
# rescue SystemCallError => e
#   # handle system call errors
#   false
# else          # after rescue but b4 ensure
#   puts "Well done no exceptions"
# ensure        # always executed
#   hatch_file.close if hatch_file
# end

# RETRY
# xfer to beginning of begin end block or beg of method

# def batten_hatches
#   hatch_list = API.request("/hatches")  # <--
#   # ...
# rescue RuntimeError => e
#   attempts ||= 0
#   attempts += 1
#   if attempts < 3
#     puts e.message + ". Retrying request."
#     retry                               #  <--
#   else
#     puts "Request failed"
#     raise
#   end
# end

# throw catch - if need exception like non linear flow control but aren't handling errors