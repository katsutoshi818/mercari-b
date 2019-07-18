class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :seller_user, class_name: 'User', foreign_key: 'seller_user_id'
  belongs_to :buyer_user, class_name: 'User', foreign_key: 'buyer_user_id'
  belongs_to :brand
  belongs_to :category
  belongs_to :product_size
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

  enum product_state: {"商品の状態を選択してください": 0, "とても良い": 1, "良い": 2, "普通": 3, "悪い": 4, "とても悪い": 5 }
  enum who_pays_shipping_fee: {"送料負担者を選択してください": 0, "発送者負担": 1, "購入者負担": 2}
  enum days_to_ship: {"発送日数を選択してください": 0, "1〜2日で発送": 1, "3〜4日で発送": 2, "1週間以内に発送": 3}
  enum trade_state: {"trade": 0, "buying": 1, "stopping": 2, "buyed": 3}
  enum way_to_ship: {"発送方法を選択してください": 0, "らくらくメルカリ便": 1, "ゆうゆうメルカリ便": 2, "一般運送会社": 3}
end
