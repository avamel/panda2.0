class Tour < ActiveRecord::Base
  has_many :galleries, :as => :imageable, dependent: :destroy
  has_many :days, dependent: :destroy
  has_many :country_tours
  has_many :countries, :through => :country_tours
  has_many :tour_dates, dependent: :destroy
  accepts_nested_attributes_for :tour_dates, :allow_destroy => true

  validates :title, presence: true
  validates :overview, presence: true
end
