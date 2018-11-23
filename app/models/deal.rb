class Deal < ApplicationRecord
    has_many :products

    validates :name, presence:true
    validates :dealRate, presence:true
end
