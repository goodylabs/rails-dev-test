# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items

  enum status: {
    new: 0,
    abandoned: 1,
    purchased: 2
  }, _prefix: true

  def count_products
    # cart_items.any? ? 12 : 0
    cart_items.sum(:quantity)
  end
end
