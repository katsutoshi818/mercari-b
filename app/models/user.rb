class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :favorites
  has_many :rates
  has_many :comments
  has_many :points, dependent: :destroy
  has_many :products, through: :favorites
  has_one :addressee, dependent: :destroy
  has_one :profile, dependent: :destroy
  validates :nickname, presence: true
  validates :phone_number, presence: true
end
