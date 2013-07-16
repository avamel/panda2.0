class Country < ActiveRecord::Base

  has_many :country_tours
  has_many :tours, :through => :country_tours

  scope :europe, -> { where(:region => "Europe") }
  scope :africa, -> { where(:region => "Africa") }
  scope :south_america, -> { where(:region => "South_america") }
  scope :asia, -> { where(:region => "Asia") }
  scope :also, -> { where(:region => "Also") }

  # extend FriendlyId
  # friendly_id :title, use: :slugged
end
