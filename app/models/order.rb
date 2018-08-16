class Order < ActiveRecord::Base
  validates_presence_of :email, :address, :total_price
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :order_products, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :order_products, allow_destroy: true
end