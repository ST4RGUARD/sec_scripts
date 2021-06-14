# DEFAULT PARAMS
# can include method calls or more logic
def produce_spaceship(type = :freighter, size = :xl)
  # ..
end

def produce_spaceship(type = :freighter,
                      size = calc_default_size(type))
  # ..
end

def produce_spaceship(type = :freighter,
                      size = (type == :freighter ? :xl : :m))
  # ..
end
=======
# # VARIABLE LENGTH PARAM LISTS
#
# def produce_fleet(days_to_complete, *types)
#   #...
# end
#
# produce_fleet(10,:freighter,:freighter,:explorer)
# # could also call method with splat like this
# ship_types = [:freighter,:freighter,:explorer]
# produce_fleet(15,*ship_types)
#
# # KEYWORD ARGUMENTS
#
# produce_fleet(:freighter, :m, 100, 4)
# produce_fleet(type: :freighter, size: :m,
#               fuel_tank_vol: 100,engine_cnt: 4)
#
# def produce_fleet(type: :freighter, size: :xl,
#                   fuel_tank_vol: 400,engine_cnt: 4)
#   #...
# end
#
# # can also be combined with reg param, as long as reg param comes first
# def produce_fleet(type = :freighter, size: :xl)
#   #..
# end
#
# def produce_spaceship(type = :freighter, size: m, **custom_components)
#
#   components = {engine: :standard,
#                 seats:  :standard,
#                 subwoofer: :none}
#
#   components.merge!(custom_components)
#   #...
# end
#
# produce_spaceship(:yacht, size: :s, engine: :rolls_royce, seats: :leather) # can replace custom components
#
# # METHOD ALIASING
# # overriding the method but want to access old version
# # if using super class can call super but if monkey patching need aliasing
#
# class String
#   def space_out
#     chars.join(" ")
#   end
#
#   # we want to change the string class by adding space out, but want to then add a modification to the size
#   # method to account for this change
#   # overrides method while retaining access to the original version
#   alias_method "original_size","size"
#
#   def size
#     original_size * 2 - 1
#   end
# end
#
# puts "abc".spae_out
# puts "abc".size

# OPERATORS

class Spaceship
  attr_reader :name
  attr_reader :speed

  def initialize(name)
    @name = name
    @cargo = []
    @speed = 0
    @vessels = Hash.new { [] }
  end

  # passes type to vessels hash and returns wtv is stored at that key(type)
  def [](type)
    @vessels[type]
  end

  # get & set diff types of vessels stored in the space ship
  # returns a value that can appear on left side of assignment
  # takes an index and a value to set as args
#
#   def []=(type,vehicles)
#     @vessels[type] = vehicles
#   end
#
#   # allows me to put cargo onboard easily
#   def <<(cargo)
#     @cargo << cargo
#   end
#
#   # spaceship operator compares 2 obj - rtn 0 if eq -1 if 1 < 2 and 1 if 1 > 2
#   def <=>(other)
#     name <=> other.name
#   end
#
#   # unary + - used to inc dec ship's speed
#   def +@
#     @speed += 10
#   end
#
#   def -@
#     @speed -= 10
#   end
#
#   def !
#     puts "self destruct sequence initiated"
#   end
#
# end
#
# ship1 = Spaceship.new("shipper")
# ship2 = Spaceship.new("shippy")
# ship3 = Spaceship.new("shippyiest")
#
# class Lander; end
# ship1[:landers] = [Lander.new,Lander.new]
# puts "landers: #{ship1[:landers].inspect}"
#
# class CargoPod; end
# cargo_pod = CargoPod.new
# ship1 << cargo_pod
# p ship1
#
# p [ship1,ship2,ship3].sort.map{|ship|ship.name}
#
# +ship1
# puts "speed: #{ship1.speed}"
# -ship1
# puts "speed: #{ship1.speed}"
#
# !ship1
#
# # won't work in boolean context anymore
# if !ship1
#   puts "ship isn't there"
# end
#
# # easy to get carried away with operator overload at expense of clarity - use sparingly when
# # makes code MOAR readable

# METHOD CALLS AS MESSAGES

# case input
#   when :up_arrow then ship.up
#   when :down_arrow then ship.down
# end
#
# handlers = {up_arrow: :up
#             down_arrow: :down}
#
#   ship.send(handlers[input])
# # or send msgs instead
#   ship.__send__(handlers[input])

# METHODS OUTSIDE CLASSES

# double
# main -> self.class -> obj

# METHOD MISSING

# ship.xxyy -> NoMethodError

# comes from method_missing - can override to provide more information for our use case

