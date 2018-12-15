class AddPhotoToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :photos, :text, array: true, default: []
  end
end
