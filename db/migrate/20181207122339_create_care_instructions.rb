class CreateCareInstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :care_instructions do |t|
      t.string :name

      t.timestamps
    end
  end
end
