# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true
  monetize :price_cents, numericality: { greater_than: 0 }

  def price
    Money.new(price_cents, price_currency)
  end
end
