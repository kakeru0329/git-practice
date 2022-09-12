class CartItem < ApplicationRecord

  belongs_to :items
  belongs_to :customer


  #小計
  def subtotal
    item.with_tax_price * amount
  end
  #総計
  def total_price
    (cart_item.price * 1.1).floor * cart_item.amount
  end

end