class Brand < ApplicationRecord
  belongs_to :category
  has_many :products
  validates :brand_name, presence: true, uniqueness: true
end
