class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :favorits
  has_many :rates
  has_many :comments
  has_many :points
  has_many :products, through: :favorits
  has_one :addressee
  has_one :profile
end
