class Createcatpro < ActiveRecord::Migration[5.2]
  def change
    create_join_table :product, :categories
  end
end
