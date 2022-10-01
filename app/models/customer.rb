class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :addresses
  has_many :orders

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, presence: true


# 会員フルネーム
  def full_name
    self.last_name + " " + self.first_name
  end

end