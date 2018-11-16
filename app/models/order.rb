class Order < ApplicationRecord
    belongs_to :customer
    has_many :customer

    validates :status, presence:true
    validates :cost, presence:true
    validates :quantity, presence:true
end
