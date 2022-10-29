# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password', name: "Michał", surname: "Kasperek", address: "City name", credit_card:"1234567890", role: "admin") if Rails.env.development?
User.create(email: 'michal@example.com', password: 'password', password_confirmation: 'password', name: "Michał", surname: "Kasperek", address: "City name", credit_card:"1234567890", role: "user") if Rails.env.development?
AdminUser.create(email: "admin@example.com", password: "password")


Product.create(name:"Jabłka grójeckie", price:5.00)
Product.create(name:"Czekolada mleczna", price:3.29)
Product.create(name:"Czekolada gorzka", price:3.29)
Product.create(name:"Kosiarka", price:249.99)
Product.create(name:"Woda mineralna ngaz", price: 0.99)
Product.create(name:"Woda mineralna gaz", price: 0.99)
Product.create(name:"Woda źródlana ngaz", price: 0.99)
Product.create(name:"Woda źródlana gaz", price: 0.99)
Product.where(name:"Woda źródlana gaz", price: 0.99).first_or_create

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?