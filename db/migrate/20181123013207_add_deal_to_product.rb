class AddDealToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :deal, foreign_key: true
  end
end
