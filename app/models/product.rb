class Product < ApplicationRecord
  #belongs_to :products_types
  has_many :cart_products
  has_many :ordered_products
  attachment :image
end
