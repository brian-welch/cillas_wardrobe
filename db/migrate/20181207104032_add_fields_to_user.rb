class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_name, :string
    add_column :users, :birthday, :date
    add_column :users, :address_line_one, :string
    add_column :users, :address_line_two, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :post_code, :string
    add_column :users, :mobile_number, :string
    add_reference :users, :role, foreign_key: true
  end
end
