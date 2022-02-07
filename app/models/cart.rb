# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items
  has_one :order

  # TODO:
  # maybe we should allow cart to have more then 1 checkout assigned?
  # TBD with business about possible scenarios

  has_one :checkout

  validates_associated :cart_items

  enum status: {
    new: 0,
    abandoned: 1,
    purchased: 2
  }, _prefix: true
end
