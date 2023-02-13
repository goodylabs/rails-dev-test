class AddDefaultValuesForProductsAndLineItems < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :decimal, default: 0.0
    change_column :line_items, :quantity, :integer, default: 1
  end
end
