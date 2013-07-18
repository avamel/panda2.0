class Month < ActiveRecord::Base
  belongs_to :country

  has_attached_file :teaser, :styles => {:thumb => ["326x442#", :jpg]}

  validates :preview, presence: true
  validates :country, presence: true
end
