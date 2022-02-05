require 'database_cleaner-active_record'

if Rails.env.development?
  DatabaseCleaner.clean_with(:truncation)

  ActiveRecord::Migration.say_with_time('Creating Products') do
    (1..30).each do |i|
      product = Product.new(name: "Shirt_#{i}")
      product.price = Money.new(rand(10000), 'PLN')
      product.save!
    end
  end

end