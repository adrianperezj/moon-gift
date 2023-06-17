class Gift < ApplicationRecord
  belongs_to :event
  has_one :purchase, dependent: :destroy
  has_one :user, through: :purchase
end
