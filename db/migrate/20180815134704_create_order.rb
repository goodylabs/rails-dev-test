class CreateOrder < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, :index => true
      t.string :email
      t.string :address
      t.string :card_type
      t.decimal :card_number, :precision => 20, :scale => 0
      t.integer :card_expiration_month
      t.integer :card_expiration_year
      t.decimal :card_cvv, :precision => 3, :scale => 0
      t.decimal :total_price, :precision => 10, :scale => 2
      t.timestamps
    end
  end
end
