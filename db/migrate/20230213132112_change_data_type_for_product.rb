class ChangeDataTypeForProduct < ActiveRecord::Migration[5.2]
  def self.up
    change_table :products do |t|
      t.change :price, :decimal
    end
  end
  def self.down
    change_table :products do |t|
      t.change :price, :integer
    end
  end
end
