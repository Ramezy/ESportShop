class Product < ApplicationRecord
    belongs_to :customer
    has_many :order, through: :customer

    validates :productCost, presence:true
    validates :productName, presence:true
    validates :productSize, presence:true
end
