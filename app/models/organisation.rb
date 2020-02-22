class Organisation < ApplicationRecord
  belongs_to :user
  has_many :experiences
  has_one_attached :photo
  validates :name, presence: true
  validates :location, presence: true
  validates :name, presence: true
end
