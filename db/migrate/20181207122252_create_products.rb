class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :sku
      t.integer :quantity
      t.string :product_number
      t.boolean :live_status
      t.references :brand, foreign_key: true
      t.references :size, foreign_key: true
      t.references :pattern, foreign_key: true
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
