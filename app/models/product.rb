class Product < ApplicationRecord
  belongs_to :seller_user, class_name: 'User', foreign_key: 'seller_user_id'
  belongs_to :buyer_user, class_name: 'User', foreign_key: 'buyer_user_id'
  belongs_to :brand
  belongs_to :category
  has_many :comments
  has_many :product_images
  has_many :users, through: :favorits
  validates :product_name, presence: true
  validates :introduction, presence: true
  validates :product_state, presence: true
  validates :who_pays_shipping_fee, presence: true
  validates :seller_prefecture, presence: true
  validates :days_to_ship, presence: true
  validates :price, presence: true
  validates :trade_state, presence: true
end
