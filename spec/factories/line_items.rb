FactoryBot.define do
  factory :line_item do
    quantity { 1 }
    product
    cart
    order { nil }
  end
end