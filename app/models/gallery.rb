class Gallery < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :attachment

  validates :title, presence: true

end
