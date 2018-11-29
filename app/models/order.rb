class Order < ApplicationRecord
    belongs_to :user

    belongs_to :order_status
    has_many :product_orders
    has_many :products, through: :product_orders
end
