class Currency < ActiveRecord::Base
  has_many :tours

  validates :title, presence: true, uniqueness: true
end
