class AddFieldToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :pattern, foreign_key: true
  end
end
