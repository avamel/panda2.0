class CountryTour < ActiveRecord::Base
  belongs_to :country
  belongs_to :tour
end
