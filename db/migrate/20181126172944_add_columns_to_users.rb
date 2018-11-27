class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :provinces, foreign_key: true
  end
end
