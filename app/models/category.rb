class Category < ApplicationRecord
  has_ancestry
  has_many :brands
  has_many :products
  validates :category_name, presence: true, uniqueness: true
end
