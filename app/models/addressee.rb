class Addressee < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_katakana, presence: true
  validates :last_name_katakana, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true
end
