FLOWER = 'clover'  # => "clover"

module Neighborhood
  # FLOWER = "Dogwood"

  module Yard
    # FLOWER = "Rose"

    class Parent
      # FLOWER = "Mountain Laurel"
    end # => nil

    class Child < Parent # => Neighborhood::Yard::Parent
      # FLOWER = "Dandelion"

      def flower
        ::FLOWER # force it to look up constant in Object class
        # FLOWER
      end # => :flower
    end # => :flower
  end # => :flower
end # => :flower

Neighborhood::Yard::Child.new.flower  # => "clover"
