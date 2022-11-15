FactoryBot.define do
  factory :product_order do
    quantity { Faker::Number.between(from: 1, to: 3) }
  end
end
