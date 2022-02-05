class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.monetize :price
      
      t.timestamps
    end
  end
end
