class Tour < ActiveRecord::Base
  has_many :galleries, :as => :imageable, dependent: :destroy
  has_many :dayses, dependent: :destroy

  validates :title, presence: true
  validates :overview, presence: true
end
