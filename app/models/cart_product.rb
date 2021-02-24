class CartProduct < ApplicationRecord
    validates :count, presence: true

    belongs_to :customer
    belongs_to :product
end
