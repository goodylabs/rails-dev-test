class CreateOrder < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, :foreign_key => true, :index => true
      t.string :email
      t.string :address
      t.decimal :total_price, :precision => 10, :scale => 2
      t.timestamps
    end
  end
end
