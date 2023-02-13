class Product < ApplicationRecord
  validates :price, :numericality => { :greater_than => 0 }
  validates :name, :price, presence: true
end
