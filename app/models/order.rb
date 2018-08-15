class Order < ActiveRecord::Base
  validates_presence_of :email, :address, :card_type, :card_number, :card_expiration_month, :card_expiration_year, :card_cvv
  validates :card_expiration_month, numericality: { less_than_or_equal_to: 12,  only_integer: true }
  validates :card_expiration_year, numericality: { less_than_or_equal_to: 99,  only_integer: true }
  validates :card_cvv, numericality: { less_than_or_equal_to: 999,  only_integer: true }
  validates_format_of :card_number, :with => /\d{16}/i
  has_many :order_products, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :order_products, allow_destroy: true
end