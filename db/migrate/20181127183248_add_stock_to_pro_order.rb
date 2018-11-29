class AddStockToProOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :stock, :decimal
  end
end
