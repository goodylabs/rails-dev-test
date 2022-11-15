FactoryBot.define do
  factory :product do
    name { Faker::Coffee.blend_name }
    description { Faker::Coffee.notes }
    price { Faker::Commerce.price }
    category { Product.categories[:arabica] }
    quantity { Faker::Number.between(from: 1, to: 15) }
  end
end
