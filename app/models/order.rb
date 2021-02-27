class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_products, dependent: :destroy

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :receiver_name, presence: true

  def get_shipping_informations_from(resource)
    class_name = resource.class.name
    if class_name == 'Customer' # resource: Customer
      self.postal_code = resource.postal_code
      self.address = resource.address
      self.receiver_name = resource.family_name + resource.first_name
    elsif class_name == 'Receiver' # resource: Receiver
      self.postal_code = resource.postal_code
      self.address = resource.address
      self.receiver_name = resource.name
    end
  end
end
