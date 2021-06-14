# copy of obj
# obj = "my name"
# copy = obj
#
# obj.upcase!
# puts obj
# puts copy
#
# p obj.object_id
# p copy.object_id
#
# # clone of obj -> new obj
# new_obj = obj.clone
# new_obj.downcase!
#
# p new_obj
# p obj
#
# p new_obj.object_id
# p obj.object_id

# ATTRIBUTE ACCESSOR - INSTANCE VAR

# class Spaceship
  # same as getter and setter dest methods below
  # attr_accessor :destination, :name
  # def launch(destination)
  #   @destination = destination  # inst var private only accessed inside methods
  #   # go toward destination
  # end
  #
  # def destination
  #   @destination
  # end
  #
  # def destination=(new_destination)
  #   @destination = new_destination
  # end
#
#   def cancel_launch
#     destination = ""        # creates local var
#     self.destination = ""
#   end
# end
#
# ship = Spaceship.new
# ship.launch("Earth")
# p ship
# p ship.destination = "Earth"
#
# INITIALIZE
#
# class Spaceship
#   def initialize(name,cargo_module_count)
#     @name        = name
#     @cargo_hold  = cargo_module_count
#     @power_level = 100
#   end
# end
#
# ship = Spaceship.new("Dreadnaught",4)
# p ship
#
# class Probe
#   def deploy(deploy_time,return_time)
#     puts "deploying"
#   end
#   def take_sample
#   end
# end
#
# # we want to take 2 different kinds of samples during our probe
# class MineralProbe < Probe
#   def deploy(deploy_time)
#     puts "preparing chamber"
#     super(deploy_time, Time.now + 2 * 60 * 60)
#   end
#   def take_sample
#   end
# end
# class AtmosphericProbe < Probe
#   def take_sample
#   end
# end
#
# MineralProbe.new.deploy(Time.now)

# INHERITANCE - for re-using functionality not enforcing interfaces

# class Probe
#   def dock
#     # probe specific
#     # docking actions
#   end
# end
#
# class Lander
#   def dock
#     # lander specific
#     # docking actions
#   end
# end
#
# class Spaceship
#   def capture(unit)
#     unit.dock       # works on anything with dock method
#     transport_to_storage(unit)
#   end
# end
#
# ship = Spaceship.new
# ship.capture(probe)
# ship.capture(lander)

# CLASS METHODS
# class method makes it clearer that this functionality is not reliant on obj state
# class Spaceship
#   def self.thruster_count
#     2
#   end
# end

# Spaceship.thruster_count
# ship = Spaceship.new      # this work
# ship.thruster_count       # this !work

# CLASS VARIABLES
# 1 copy of class var & shared between all obj & subclasses of that class
# probably best to avoid class var
# class Spaceship
#   @@thruster_count = 2
#   def self.thruster_count
#     @@thruster_count
#   end
# end
#
# class SpritelySpaceship < Spaceship
#   @@thruster_count = 4
# end
#
# class EconolineSpaceship < Spaceship
#   @@thruster_count = 1
# end
#
# puts SpritelySpaceship.thruster_count
#
# # CLASS INSTANCE VARIABLE
# class Spaceship
#   @thruster_count = 2
#   def self.thruster_count
#     @thruster_count
#   end
# end
#
# class SpritelySpaceship < Spaceship
#   @thruster_count = 4
# end
#
# class EconolineSpaceship < Spaceship
#   @thruster_count = 1
# end
# puts "----"
# puts SpritelySpaceship.thruster_count
# puts EconolineSpaceship.thruster_count
# puts Spaceship.thruster_count

# METHOD VISIBILITY

# class Spaceship
#   def launch
#     batten_hatches
#   end
# # every method below private until changed
# private                       # or the more used way
#
#   def batten_hatches
#     puts "what is batten?"
#   end
#   private :batten_hatches     # like this
# end
#
# ship = Spaceship.new
# ship.batten_hatches           # can't do private
# ship.send :batten_hatches

# public - default
# private - can't be called with an explicit rcvr - allows subclasses to use private methods
# private_class_method - is used to make class methods private
# protected - allow access for other obj of the same class
# private & protected not used a lot

# def greet(greeting)
#   puts greeting + ", captain!"
# end
#
# res = class Spaceship
#         answer = 7*6
#         puts "Calculating in class context: " + answer.to_s
#         greet("Good morning")
#         answer
# end
#
# puts "The class calculated: " + res.to_s
# puts Spaceship.superclass

# self refers current execution
# inside class - refers to class self. class method instead of instance

# perfectly valid code re-opens Spaceship class to call launch method

# class Spaceship
#   def hatch
#   end
# end
#
# ship = Spaceship.new
#
# class Spaceship
#   def launch
#   end
# end
#
# ship.launch
#
# class Spaceship
#   def launch
#     puts "LAUNCH"
#   end
# end
#
# ship.launch

# MONKEYPATCHING - dangerous can make code brittle with new updates etc

class String
  def space
    chars.join(" ")
  end

  def size
    "Useless string"
  end
end

puts "canyouhearme".space
puts "yesican".size

# EQUALITY

class Spaceship
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other)
    name == other.name
  end
end

ship1 = Spaceship.new("testme")
ship2 = Spaceship.new("testme")

# equal should not be overwritten, this is pointer comparison...equal is identity comparison
puts ship1.equal?(ship2)
puts ship1 == ship2