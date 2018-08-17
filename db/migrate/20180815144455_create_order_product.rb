class CreateOrderProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products do |t|
      t.references :order, :foreign_key => true, :index => true
      t.references :product, :foreign_key => true, :index => true
      t.integer :quantity
      t.decimal :price, :precision => 10, :scale => 2
    end
  end
end
