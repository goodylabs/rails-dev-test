# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart

  enum status: {
    new: 0,
    in_progress: 1,
    waiting_for_payment: 2,
    waiting_for_delivery: 3,
    closed: 4,
    abandoned: 5
  }, _prefix: true

  def value
    Money.new(value_cents, value_currency)
  end
end
