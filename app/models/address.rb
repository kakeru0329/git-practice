class Address < ApplicationRecord

  belongs_to :customer

validates :postal_code, :address, :name, presence: true


  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end

end
