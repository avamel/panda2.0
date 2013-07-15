class Gallery < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  validates :title, presence: true
end
