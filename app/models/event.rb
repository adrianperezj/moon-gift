class Event < ApplicationRecord
  belongs_to :user
  has_many :gifts, dependent: :destroy
end
