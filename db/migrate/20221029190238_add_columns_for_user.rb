class AddColumnsForUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :address, :string
    add_column :users, :credit_card, :string
    add_column :users, :role, :integer
  end
end
