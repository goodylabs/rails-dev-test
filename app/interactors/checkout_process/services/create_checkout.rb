# frozen_string_literal: true

class CheckoutProcess
  module Services
    class CreateCheckout
      include Dry::Monads[:result]

      def call(shopping_cart:)
        cart = shopping_cart.cart

        checkout = Checkout.new(cart_id: cart.id, status: :new)

        if checkout.save
          Success(checkout)
        else
          Failure(message: checkout.errors)
        end
      end
    end
  end
end
