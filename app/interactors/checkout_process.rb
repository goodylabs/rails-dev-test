# frozen_string_literal: true

class CheckoutProcess
  include Dry::Monads[:result]
  attr_reader :shopping_cart
  attr_accessor :order

  def initialize(shopping_cart)
    @shopping_cart = shopping_cart
    @order = build_order
  end

  private

  def build_order
    create_order unless shopping_cart.cart.order
    shopping_cart.cart.order
  end

  def create_order
    result = CheckoutProcess::Services::CreateOrder.new.call(shopping_cart: shopping_cart)
    result.value!
  end
end
