# BLOCKS
#
# [1,2,3].each do
#   puts "stuff"
# end
#
# [1,2,3].each{|num|puts num}
#
# class Spaceship
#   def debug_only
#     return nil unless @debug
#     reuturn nil unless block_given?
#     puts "running code..."
#     yield @debug_attrs                          # if debug requires args pass to yeild
#   end
# end
#
# ship.debug_only # does nothing
# ship.debug_only do
#   puts "This is debug output"
# end
#
# ship.debug_only do |attrs|
#   puts "Debug attr values : #{attrs.inspect}"
# end

# BLOCK LOCAL VARS
#
# $debug = true
#
# def debug_only
#   yield if $debug && block_given?
# end
#
# class Spaceship
#   def initialize
#     @debug_attrs = {containment_status: :ok, core_temp: 350}
#   end
#
#   def launch
#     debug_only {p @debug_attrs }
#   end
#
# end
#
# Spaceship.new.launch

# executes start time, then exec block, then calc time taken to exec block

# def with_timing
#   start = Time.now
#   if block_given?
#     yield
#     puts "Time taken: #{Time.now - start} sec"
#   end
# end
#
# # code to operate
#
# def operation_1
#   sleep(1)
# end
#
# def operation_2; end
#
# with_timing do
#   operation_1
#   operation_2
# end

# PROCS - can give block a name in param list - convert block into obj
#
# def debug_only(param = nil, &block)
#   puts "Param class: #{param.class}"                  #NilClass
#   puts "Block class: #{block.class}" if block_given?  #Proc
# end
#
# debug_only{}
# puts "---"
# p = Proc.new {|bla| puts "I'm a proc that says #{bla}!"}
# p = proc {|blah| puts "I'm a proc that says #{bla}!"}
#
# #call
# p.call "woot!"
# p.yield "wootwoot"
# p.("nowoot")
# p["wootz"]
#
# debug_only(p)_
# puts "---"
# debug_only(&p)

# LAMBDAS
# convert block into obj converts block into proc

# lmb = lambda {|bla| "I'm also a proc, and I say #{bla}"}
# also_lmb = ->(blah){ "I'm also a proc, and I say #{bla}"}

# Differences
# Procs behave like Blocks - allow you to drop code into a method, but with more flexibility bc they are named
# can be passed around like reg obj

# lambdas are like anyonymous methods, are strict about args
# diff in arg handling - lambdas - too many or too few args cause an exception, Procs - extra args discarded
# missing args set to nil
# diff in return and break handling - procs - return is executed in the scope where block was def
# procs - break isn't allowed outside a loop -- shouldn't use return or break in procs - should try to avoid
# return in blocks too
# lambdas - break and return both return control to the calling method

# check args expected
# proc {|a, b|}.arity
# # if arg is optional returns non optional args + 1 & then converts to -
# proc {|a, *b, c|}.arity
#
# # symbol to proc conversion
# def debug_only(param = nil, &block)
#   puts "Param class: #{param.class}"
#   puts "Block class: #{block.class}" if block_given?
# end

# debug_only(p)  # param == p
# debug_only(&p) # param == nil, block == p   tells ruby to treat as block & tries to coerce obj into proc
#
# names = ["jabby","doot","lokiri"]
# up_name = names.map{|name|name.upcase}
#
# # instead of passing block we can give it a symbol and tell it to treat as block - if not proc will cal to_proc
# up_name = names.map(&:upcase)   # with & will coerce

# CONSTANTS
#
# MAX_SPEED = 1000
# # can modify constants
# # with freeze cannot - runtime error thrown
# TYPES = []
# TYPES.freeze
# TYPES << "yo"
# # can't unfreeze, but can check to see if frozen
# TYPES.frozen?
#
# # CONST within class can't be accessed outside without class and double colon, can't def const inside meth
# class A; MIN_SPEED = 0; end
# MIN_SPEED
# A::MIN_SPEED
# # can add another CONST to class the same way
# A::MAX_SPEED = 100
#
# # MODULES
# # all ApI related meth can go into api module
# module API
#   def self.hatch_list     # methods need to be added as module lvl methods - by prefixing with self
#     # ...
#   end
# end
#
# hatches = API.hatch_list
#
# module SpaceStuff
#   class Spaceship
#   end
# end
#
# ship = SpaceStuff::Spaceship.new        # if classes can be accessed like any other CONST with scope operator

# MIXIN
# alt to multiple inheritance
# instance methods become available as instance meth of the class

# module AirControl
#   def measure_oxygen
#     #...
#   end
# end
#
# class Spaceship
#   include AirControl
# end
#
# ship = Spaceship.new
# ship.measure_oxygen

# instance methods in module become available as class methods
# module Docking
#   def get_docking_params
#     #..
#   end
# end
#
# class Spaceship
#   extend Docking
# end
#
# Spaceship.get_docking_params