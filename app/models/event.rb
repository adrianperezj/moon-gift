class Event < ApplicationRecord
  belongs_to :user
  has_many :gifts, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true
  validates :date, presence: true

  include Pundit
end
