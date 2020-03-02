class Order < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  has_many :reviews
  monetize :amount_cents
end
