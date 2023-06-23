class Gift < ApplicationRecord
  belongs_to :event
  has_one :purchase, dependent: :destroy
  has_one :user, through: :purchase
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :event_id, presence: true
end
