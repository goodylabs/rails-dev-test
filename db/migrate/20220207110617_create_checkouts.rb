class CreateCheckouts < ActiveRecord::Migration[5.2]
  def change
    create_table :checkouts do |t|
      t.references :cart, index: true, foreign_key: true, null: false
      t.json :customer_details, default: '{}'
      t.json :delivery_address, default: '{}'
      t.json :payment_details, default: '{}'
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
