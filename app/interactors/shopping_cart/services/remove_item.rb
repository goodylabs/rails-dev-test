# frozen_string_literal: true

class ShoppingCart
  module Services
    class RemoveItem
      include Dry::Monads[:result]

      def call(cart:, product_id:)
        cart_item = cart.cart_items.where(product_id: product_id).first
        Success(cart) if cart_item.delete
      end
    end
  end
end
