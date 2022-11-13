class CreateProductOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :product_orders do |t|
      t.belongs_to :product
      t.belongs_to :cart
      t.belongs_to :order
      t.integer :quantity
      t.timestamps
    end
  end
end
