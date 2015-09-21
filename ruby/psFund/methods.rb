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

