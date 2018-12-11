class ChangeColumnInCareInstruction < ActiveRecord::Migration[5.2]
  def change
    rename_column :care_instructions, :name, :copy
  end
end
