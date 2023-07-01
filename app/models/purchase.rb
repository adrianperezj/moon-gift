class Purchase < ApplicationRecord
  belongs_to :gift
  belongs_to :user

  include Pundit
end

class Purchase < ApplicationRecord
  validates :payment_method, inclusion: { in: ["Credit Card", "Debit Card"] }
end
