class Month < ActiveRecord::Base
  belongs_to :country

  has_attached_file :teaser, :styles => { :thumb => ["239x204#", :jpg] }
end
