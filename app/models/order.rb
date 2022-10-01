class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }

  def total
    total_amount += freight#総合計＋送料
  end


  def total_price
    (order_details.price * 1.1).floor * order_details.amount
  end

end