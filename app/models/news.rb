class News < ApplicationRecord
  validates :title, presence: true
end
