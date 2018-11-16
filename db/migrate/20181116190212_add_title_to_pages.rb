class AddTitleToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :Title, :string
  end
end
