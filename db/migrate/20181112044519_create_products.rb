class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :productCost
      t.string :productName
      t.integer :productSize
      t.string :productStyle
      t.string :productType
      t.string :productImage
      t.string :productDescription

      t.timestamps
    end
  end
end
