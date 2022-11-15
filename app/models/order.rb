class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders

  after_create_commit :move_product_orders_form_cart

  validate :check_products_availability

  private

  def check_products_availability
    user.cart.product_orders.each do |product_order|
      if product_order.quantity > product_order.product.quantity
        errors.add(:availability, I18n.t('errors.availability'))
        return
      end
    end
  end

  def move_product_orders_form_cart
    user.cart.product_orders.each do |product_order|
      product_order.update(cart_id: nil, order_id: id)
      ProductsService.new(product_order.product.id, product_order.quantity).decrease_quantity
    end
  end
end
