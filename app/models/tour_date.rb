class TourDate < ActiveRecord::Base
  scope :actual_dates, -> {where("date > ?", Date.today)}
  has_many :tour_date_links
  has_many :tours, :through => :tour_date_links

  belongs_to :tour
  validates :date, presence: true
end
