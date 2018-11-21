class DropCatProTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :categories_product
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
