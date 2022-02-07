# frozen_string_literal: true

class Checkout < ApplicationRecord
  # TODO
  # add reference to Payment model instead of storing it in `payment_details` - information about payments should be stored in dedicated Model
  # Alternatively (to make BI reports faster) checkout could store only iformation about payment method

  belongs_to :cart

  enum status: {
    new: 0,
    in_progress: 1,
    abandoned: 2,
    finished: 3

  }, _prefix: true
end
