class CreateProductMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :product_materials do |t|
      t.references :product, foreign_key: true
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
