class Order < ActiveRecord::Base
  validates_presence_of :email, :address, :card_type, :card_number, :card_expiration_date, :card_cvv
  validates_format_of :card_expiration_date, :with => /^(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})$/
end