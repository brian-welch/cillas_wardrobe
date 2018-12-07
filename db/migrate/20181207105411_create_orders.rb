class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :buyer_first_name
      t.string :buyer_last_name
      t.string :buyer_address_line_one
      t.string :buyer_address_line_two
      t.string :buyer_city
      t.string :buyer_state
      t.string :buyer_country
      t.string :buyer_post_code
      t.string :buyer_email
      t.string :buyer_mobile_number
      t.string :receiver_first_name
      t.string :receiver_last_name
      t.string :reciever_address_line_one
      t.string :receiver_address_line_two
      t.string :receiver_city
      t.string :receiver_state
      t.string :reciever_country
      t.string :receiver_post_code
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
