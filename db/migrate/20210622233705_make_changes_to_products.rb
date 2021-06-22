class MakeChangesToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :inventory, :integer
    change_column :products, :price, :decimal, precision: 6, scale: 2
    change_column :products, :description, :text
  end
end
