class Order < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  monetize :amount_cents
  has_many :reviews
  # has_one :review, dependent: :destroy
end
