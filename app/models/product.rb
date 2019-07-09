class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :seller_user, class_name: 'User', foreign_key: 'seller_user_id'
  belongs_to :buyer_user, class_name: 'User', foreign_key: 'buyer_user_id'
  belongs_to :brand
  belongs_to :category
  has_many :comments
  has_many :product_images, dependent: :destroy
  has_many :users, through: :favorites
  validates :product_name, presence: true
  validates :introduction, presence: true
  validates :product_state, presence: true
  validates :who_pays_shipping_fee, presence: true
  validates :prefecture_id, presence: true
  validates :days_to_ship, presence: true
  validates :price, presence: true
  validates :trade_state, presence: true
end
