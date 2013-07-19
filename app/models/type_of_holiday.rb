class TypeOfHoliday < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :type_of_tours
  has_many :tours, :through => :type_of_tours
end
