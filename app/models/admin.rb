class Admin < ApplicationRecord
    validates :name, presence:true
    validates :address, presence:true
end
