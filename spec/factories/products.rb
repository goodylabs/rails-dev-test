# frozen_string_literal: true

FactoryBot.define do
  factory(:product) do
    name { Faker::Commerce.product_name }
    price_cents { 1000 }
    price_currency { 'PLN' }
  end
end
