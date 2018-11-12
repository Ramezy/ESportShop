class CreateProductOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :product_orders do |t|
      t.references :product
      t.references :order
      t.integer :quantity

      t.timestamps
    end
  end
end
