class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_deatails
  has_many :orders
	belongs_to :genre


  has_one_attached :image

  validates :name , presence: true
  validates :with_tax_price, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price, presence: true


  def get_image(width, height)
    unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def with_tax_price#(税込み)
    (price * 1.1).floor
  end
  

end