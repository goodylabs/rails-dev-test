# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can [:index], Product
    can [:show], Cart, id: user.cart&.id

    product_order_ids = ProductOrder.where(cart_id: user.cart&.id).pluck(:id)
    can [:create], ProductOrder
    can [:destroy], ProductOrder, id: product_order_ids

    order_ids = Order.where(user_id: user.id).pluck(:id)
    can [:create], Order
    can [:index], Order, id: order_ids
  end
end
