class DeleteNameAndAddCardNumberToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :credit_card_number, :string
    remove_column :orders, :name
  end
end
