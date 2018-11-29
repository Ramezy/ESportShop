class AddQtyToProOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :product_orders, :total, :decimal
  end
end
