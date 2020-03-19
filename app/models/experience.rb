class Experience < ApplicationRecord
  belongs_to :organisation
  has_many :orders, dependent: :destroy
  has_many :reviews, through: :orders
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :category, presence: true
  monetize :price_cents


  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


  include PgSearch::Model
  pg_search_scope :search_by_location_and_category,
    against: [ :location, :category ],
    using: {
    tsearch: { prefix: true }
    }

end
