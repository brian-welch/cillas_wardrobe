class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :price
      t.string :sku
      t.string :quantity
      t.string :size
      t.string :product_number
      t.references :brand, foreign_key: true
      t.references :country, foreign_key: true
      t.references :color, foreign_key: true
      t.references :style, foreign_key: true
      t.references :segment, foreign_key: true
      t.references :main_category, foreign_key: true
      t.references :category, foreign_key: true
      t.references :sub_category, foreign_key: true

      t.timestamps
    end
  end
end
