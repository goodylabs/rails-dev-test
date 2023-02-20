class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  validates :email, :address, :credit_card_number, presence: true
end
