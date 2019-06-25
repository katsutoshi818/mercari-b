class Point < ApplicationRecord
  belongs_to :user
  validates :given_point, presence: true
end
