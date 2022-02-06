# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items
  validates_associated :cart_items

  enum status: {
    new: 0,
    abandoned: 1,
    purchased: 2
  }, _prefix: true
end
