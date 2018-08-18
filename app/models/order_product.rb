# == Schema Information
#
# Table name: order_products
#
#  id         :bigint(8)        not null, primary key
#  order_id   :bigint(8)
#  product_id :bigint(8)
#  quantity   :integer
#  price      :decimal(10, 2)
#

class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
end
