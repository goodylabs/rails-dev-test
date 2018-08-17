# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.destroy_all
Product.destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Product.create!([{
                   name: "Product 1",
                   quantity: 20,
                   price: 29.88,
               },
               {
                   name: "Product 2",
                   quantity: 10,
                   price: 129.88,
               },
               {
                   name: "Product 3",
                   quantity: 20,
                   price: 9.50,
               },
               {
                   name: "Product 4",
                   quantity: 11,
                   price: 5.77,
               },
               {
                   name: "Product 5",
                   quantity: 5,
                   price: 9.23,
               },
               {
                   name: "Product 6",
                   quantity: 1,
                   price: 78.28,
               },
               {
                   name: "Product 7",
                   quantity: 3,
                   price: 1.60,
               },
               {
                   name: "Product 8",
                   quantity: 78,
                   price: 55.77,
               },
               {
                   name: "Product 9",
                   quantity: 34,
                   price: 19.23,
               }])

p "Created #{Product.count} products"