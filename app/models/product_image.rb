class ProductImage < ApplicationRecord
  belongs_to :product
  validates :image, presence: true
end
