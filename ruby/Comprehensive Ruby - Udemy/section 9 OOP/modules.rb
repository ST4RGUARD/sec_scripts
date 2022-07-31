# class Sale
#   def initialize(params)
#     @params = params
#   end

#   def call
#     puts "Prams in class: #{@params}"
#   end
# end

# sale = Sale.new("Class params")
# sale.call

module Sale
  # trying a module
  module FormBuilder
    class << self
      def call(params)
        subtotal = params[:subtotal]
        state_name = params[:state_name]

        tax_amount = subtotal * tax_rate(state_name)
        subtotal + tax_amount
      end

      private

      def tax_rate(state)
        case state
        when 'AZ'
          0.065
        when 'CA'
          0.087
        end
      end
    end
  end
end

# Sale.call("test params")
# Sale::FormBuilder.call("test params")

form_data = {
  subtotal: 5.5,
  state_name: 'AZ'
}

Sale::FormBuilder.call(form_data)
