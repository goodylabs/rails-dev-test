class Product < ApplicationRecord
    has_many :orderables
    has_many :carts, through: :orderables

    validates :name, presence: true, length: {minimum: 2, maximum: 30, message: "Product name must be at least 2 characters"}
    validates :price, presence: true, numericality: {less_than_or_equal_to: 1_000_000.0, greater_than_or_equal_to: 0.01}
end
