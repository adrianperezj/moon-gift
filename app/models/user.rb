class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_one :gift, through: :purchases
end
