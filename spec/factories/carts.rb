# frozen_string_literal: true

FactoryBot.define do
  factory(:cart) do
    identifier { Faker::Alphanumeric.alphanumeric(number: 10) }
    status { :new }

    transient do
      number_of_items { 0 }
    end

    after(:create) do |cart, evaluator|
      products = create_list(:product, evaluator.number_of_items)
      evaluator.number_of_items.times do |index|
        product = products[index]

        cart.cart_items << CartItem.new(
          product_id: product.id,
          quantity: 1,
          price_cents: product.price_cents,
          price_currency: 'PLN'
        )
      end
    end
  end
end
