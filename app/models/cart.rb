class Cart < ApplicationRecord
  belongs_to :user
  has_many :product_orders

  def total_price
    product_orders.map {|po| po.quantity * po.product.price }.sum
  end
end
