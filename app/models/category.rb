class Category < ApplicationRecord
  has_ancestry
  has_many :brands
  has_many :products
end
