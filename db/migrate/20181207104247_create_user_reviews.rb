class CreateUserReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.string :subject
      t.text :body
      t.integer :stars
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
