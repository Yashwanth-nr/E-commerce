class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :carts, :qauntity, :quantity
  end
end
