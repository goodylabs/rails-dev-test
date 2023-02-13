class Product < ApplicationRecord
  validates :price, :numericality => { :greater_than => 0 }
  validates :name, :price, presence: true

  has_many :line_items, dependent: :destroy
end
