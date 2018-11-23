class Page < ApplicationRecord
    validates :Title, presence:true
    validates :Content, presence:true
end
