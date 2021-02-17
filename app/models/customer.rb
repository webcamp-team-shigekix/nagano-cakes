class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :phone_number, presence: true
  validates :postal_code, presence: true
  
  has_many :receivers, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  has_many :cart_products
  
end
