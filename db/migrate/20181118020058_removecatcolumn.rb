class Removecatcolumn < ActiveRecord::Migration[5.2]
  def change
    drop_table :categorization
  end
end
