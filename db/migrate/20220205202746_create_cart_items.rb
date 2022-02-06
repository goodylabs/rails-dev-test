class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :cart, type: :integer, index: true, foreign_key: true
      t.references :product, type: :integer, index: true, foreign_key: true
      t.integer :quantity
      t.monetize :price

      t.timestamps
    end
  end
end
