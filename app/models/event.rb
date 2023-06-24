class Event < ApplicationRecord
  belongs_to :user
  has_many :gifts, dependent: :destroy
  validates :name, presence: true
  validates :date, presence: true
end
