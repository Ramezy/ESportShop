class Product < ApplicationRecord
    mount_uploader :productImage, ImageUploader
    has_many :product_orders
    has_many :orders, through: :product_orders

    validates :productCost, presence:true
    validates :productName, presence:true
    validates :productSize, presence:true
end
