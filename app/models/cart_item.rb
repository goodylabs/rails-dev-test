# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def price
    Money.new(price_cents, price_currency)
  end
end
