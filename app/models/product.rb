class Product < ApplicationRecord
    mount_uploader :productImage, ImageUploader
    has_many :product_orders
    has_many :orders, through: :product_orders
    belongs_to :category

    paginates_per 10

    validates :productCost, presence:true
    validates :productName, presence:true
    validates :productSize, presence:true
end
