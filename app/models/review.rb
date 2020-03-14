class Review < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  has_many_attached :photos
  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
