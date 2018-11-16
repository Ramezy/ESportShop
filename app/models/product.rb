class Product < ApplicationRecord
    has_many :product_orders
    has_many :orders, through: :product_orders

    validates :productCost, presence:true
    validates :productName, presence:true
    validates :productSize, presence:true
end
