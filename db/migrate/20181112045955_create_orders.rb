class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.references :admin, foreign_key: true
      t.integer :cost
      t.integer :quantity

      t.timestamps
    end
  end
end
