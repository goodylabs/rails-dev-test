# frozen_string_literal: true

class ShoppingCart
  module Services
    class UpdateItem
      include Dry::Monads[:result]

      def call(cart:, product_id:, quantity:)
        product = Product.find(product_id)

        cart_item = cart.cart_items.where(product_id: product_id).first
        current_quantity = cart_item.quantity
        new_quantity = current_quantity + quantity.to_i
        new_price_cents = new_quantity * product.price_cents

        if cart_item.update(quantity: new_quantity, price_cents: new_price_cents)
          Success(cart)
        else
          Failure(message: cart_item.errors)
        end
      end
    end
  end
end
