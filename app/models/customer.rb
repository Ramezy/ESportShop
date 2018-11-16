class Customer < ApplicationRecord
    has_many :orders, through: :product_orders

    #validates: name, presence: :true

end
