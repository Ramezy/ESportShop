class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.references :order_status
      t.decimal :total
      t.decimal :taxes
      t.string :tax_info
      t.decimal :grand_total
      t.string :charge_id
      t.references :user

      t.timestamps
    end
  end
end
