class Cart < ApplicationRecord
  belongs_to :user
  has_many :product_orders, dependent: :destroy

  def total_price
    product_orders.map {|po| po.quantity * po.product.price }.sum
  end
end
