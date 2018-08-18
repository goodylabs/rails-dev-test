# == Schema Information
#
# Table name: orders
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)
#  email       :string(255)
#  address     :string(255)
#  total_price :decimal(10, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Order < ActiveRecord::Base
  validates_presence_of :email, :address, :total_price
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :order_products, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :order_products, allow_destroy: true
end
