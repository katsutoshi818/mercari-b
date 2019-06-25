class Product < ApplicationRecord
  belongs_to :seller_user, class_name: 'User', foreign_key: 'seller_user_id'
  belongs_to :buyer_user, class_name: 'User', foreign_key: 'buyer_user_id'
  belongs_to :brand
  belongs_to :category
  has_many :comments
  has_many :product_images
  has_many :users, through: :favorits
end
