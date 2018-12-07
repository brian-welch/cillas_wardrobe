class CreateProductCareInstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :product_care_instructions do |t|
      t.references :product, foreign_key: true
      t.references :care_instruction, foreign_key: true

      t.timestamps
    end
  end
end
