class TourDate < ActiveRecord::Base
  has_many :tour_date_links
  has_many :tours, :through => :tour_date_links

  belongs_to :tour
  validates :date, presence: true
end
