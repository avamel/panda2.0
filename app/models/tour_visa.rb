class TourVisa < ActiveRecord::Base
  belongs_to :tour
  belongs_to :visa
end
