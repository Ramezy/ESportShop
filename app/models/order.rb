class Order < ApplicationRecord
    belongs_to :admin
    has_many :customer

    validates :status, presence:true
    validates :cost, presence:true
    validates :quantity, presence:true
end
