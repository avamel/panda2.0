class Gallery < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :attachment, :styles => { :slider_thumb => "104x52#", :thumb  => "70x60>", :medium => "200x200" }, :url  => "/assets/galleries/:id/:style/:basename.:extension"

  validates :title, presence: true

end
