class TypeOfTour < ActiveRecord::Base
  belongs_to :type_of_holiday
  belongs_to :tour
end
