class Product < ApplicationRecord
  belongs_to :product_type
  has_many :cart_products
  has_many :ordered_products
  attachment :image
end
