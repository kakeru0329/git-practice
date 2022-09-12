class OrderDetail < ApplicationRecord

  has_many :genres

  belongs_to :customers
  belongs_to :items
end
