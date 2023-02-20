class Product < ApplicationRecord
  validates :name, :price, presence: true

  has_many :line_items, dependent: :destroy
end
