class AddDefaultValueForProductsAndProductOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :category, :integer, default: 0, null: false
    change_column :products, :quantity, :integer, default: 0, null: false
    change_column :product_orders, :quantity, :integer, default: 1, null: false
  end
end
