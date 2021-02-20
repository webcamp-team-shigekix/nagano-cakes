class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_products, dependent: :destroy

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :receiver_name, presence: true
end
