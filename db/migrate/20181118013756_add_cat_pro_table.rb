class AddCatProTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :product, table_name: :categorization do |t|
      t.index :product_id
      t.index :categories_id
    end
  end
end
