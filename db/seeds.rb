# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# user
user = FactoryBot.create(
  :user
)

# cart
cart = FactoryBot.create(
  :cart,
  user_id: user.id
)

# products
rand(10..20).times do |_i|
  product = FactoryBot.create(
    :product
  )
  next unless [true, false].sample

  FactoryBot.create(
    :product_order,
    product_id: product.id,
    cart_id: cart.id
  )
end
