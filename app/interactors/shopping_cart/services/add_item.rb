# frozen_string_literal: true

class ShoppingCart
  module Services
    class AddItem
      include Dry::Monads[:result]

      def call(cart:, product_id:, quantity:)
        product = Product.find(product_id)

        cart.cart_items << ::CartItem.new(
          product_id: product_id,
          quantity: quantity,
          price_cents: product.price_cents * quantity.to_i,
          price_currency: product.price_currency
        )

        if cart.valid?
          Success(cart)
        else
          Failure(message: cart.errors)
        end
      end
    end
  end
end
