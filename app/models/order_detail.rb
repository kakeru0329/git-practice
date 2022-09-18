class OrderDetail < ApplicationRecord

  has_many :genres

  belongs_to :customer
  belongs_to :item
end
