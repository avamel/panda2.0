class Days < ActiveRecord::Base
  belongs_to :tour

  validates :overview, presence: true
end
