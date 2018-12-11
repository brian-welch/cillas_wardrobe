class AddFieldToCareInstructions < ActiveRecord::Migration[5.2]
  def change
    add_column :care_instructions, :image, :string
  end
end
