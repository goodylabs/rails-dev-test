# frozen_string_literal: true

class CheckoutProcess
  module Services
    class CreateOrder
      include Dry::Monads[:result]

      def call(shopping_cart:)
        cart = shopping_cart.cart
        value = shopping_cart.value.cents
        currency = shopping_cart.value.currency
        order = Order.new(cart_id: cart.id, value_cents: value, value_currency: currency)

        if order.save
          Success(order)
        else
          Failure(message: order.errors)
        end
      end
    end
  end
end
