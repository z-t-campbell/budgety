class Order < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  has_one :review, dependent: :destroy
  monetize :amount_cents
end
