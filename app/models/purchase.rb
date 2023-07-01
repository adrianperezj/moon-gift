class Purchase < ApplicationRecord
  belongs_to :gift
  belongs_to :user

  include Pundit
end
