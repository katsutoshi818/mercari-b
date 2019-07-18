class ProductSize < ApplicationRecord
  has_many :products

  enum size_type: {"服のサイズ": 0}
end
