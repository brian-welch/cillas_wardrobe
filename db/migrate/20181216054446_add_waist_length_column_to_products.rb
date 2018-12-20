class AddWaistLengthColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :length, :integer
    add_column :products, :waist, :integer
  end
end
