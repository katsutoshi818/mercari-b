class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_katakana, presence: true
  validates :last_name_katakana, presence: true
  validates :birthday, presence: true
  validates :point, presence: true
end
