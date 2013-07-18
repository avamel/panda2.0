class Day < ActiveRecord::Base
  belongs_to :tour

  validates :number, presence: true
  validates :overview, presence: true
end
