class Visa < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :tour_visas
  has_many :tours, :through => :tour_visas

  def should_generate_new_friendly_id?
    false
  end
end
