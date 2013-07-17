class TourDateLink < ActiveRecord::Base
  belongs_to :tour
  belongs_to :tour_date
end
