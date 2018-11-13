class ProductOrder < ApplicationRecord
    belongs_to :order
    has_many :product, through: :order

    validates :quantity
end
