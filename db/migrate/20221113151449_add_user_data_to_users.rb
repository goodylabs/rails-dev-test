class AddUserDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :address, :text
    add_column :users, :credit_card, :string
  end
end
