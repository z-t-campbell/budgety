class Experience < ApplicationRecord
  belongs_to :user
  belongs_to :organisation
  has_many_attached :photos
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :category, presence: true
  monetize :price_cents
end
