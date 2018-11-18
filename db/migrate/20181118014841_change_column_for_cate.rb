class ChangeColumnForCate < ActiveRecord::Migration[5.2]
  def change
    change_column_null :categorization, :product_id, false
  end
end
