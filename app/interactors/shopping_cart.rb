# frozen_string_literal: true

class ShoppingCart
  include Dry::Monads[:result]

  attr_reader :cart, :cart_identifier

  def initialize(cart_identifier = nil)
    @cart_identifier = cart_identifier
    @cart = find_cart || create_cart
  end

  def create_cart
    identifier = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
    Cart.create!(identifier: identifier)
  end

  def add_item(product_id:, quantity:)
    if new_product?(product_id: product_id)
      ShoppingCart::Services::AddItem.new.call(
        cart: cart,
        product_id: product_id,
        quantity: quantity
      )
    else
      ShoppingCart::Services::UpdateItem.new.call(
        cart: cart,
        product_id: product_id,
        quantity: quantity
      )
    end
  end

  def remove_item(product_id:)
    ShoppingCart::Services::RemoveItem.new.call(
      cart: cart,
      product_id: product_id
    )
  end

  # def items
  #   store.items
  # end

  def items_count
    cart.cart_items.sum(:quantity)
  end

  private

  def find_cart
    Cart.where(identifier: cart_identifier).first
  end

  def new_product?(product_id:)
    cart.cart_items.where(product_id: product_id).empty?
  end
end
