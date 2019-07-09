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

  enum product_state: [:"商品の状態を選択してください", :"とても良い", :"良い", :"普通", :"悪い", :"とても悪い"]
  enum who_pays_shipping_fee: [:"送料負担者を選択してください", :"発送者負担", :"購入者負担"]
  enum days_to_ship: [:"発送日数を選択してください", :"1〜2日で発送", :"3〜4日で発送", :"1週間以内に発送"]
  enum trade_state: [:"trade", :"buying", :"stopping", :"buyed"]
  enum way_to_ship: [:"発送方法を選択してください", :"らくらくメルカリ便", :"ゆうゆうメルカリ便", :"一般運送会社"]
end
