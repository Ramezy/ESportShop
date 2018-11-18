class ChangeColumnForCat < ActiveRecord::Migration[5.2]
  def change
    change_column_default :categorization, :product_id, from: false, to: true
  end
end
