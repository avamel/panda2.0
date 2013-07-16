class Tour < ActiveRecord::Base
  has_many :galleries, :as => :imageable, dependent: :destroy
  has_many :days, dependent: :destroy
  belongs_to :country, :through => :country_tours

  validates :title, presence: true
  validates :overview, presence: true
end
