FactoryBot.define do
  factory :order do
    email { "test@example.com" }
    address { "123 Main St" }
    credit_card_number { "4111111111111111" }
  end
end
