class ChangeColumnInProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :status, :live_status
  end
end
