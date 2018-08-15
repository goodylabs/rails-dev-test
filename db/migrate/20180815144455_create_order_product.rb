class CreateOrderProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products do |t|
      t.references :order, :index => true
      t.references :product, :index => true
      t.integer :quantity
      t.decimal :price, :precision => 10, :scale => 2
    end
  end
end
