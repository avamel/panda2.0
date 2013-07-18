class Gallery < ActiveRecord::Base
  belongs_to :tour

  has_attached_file :source, :styles => { :thumb => ["128x128>", :jpg], :medium => ["670x340#", :jpg], :slider_thumb => "104x52#", :index_thumb  => "70x60>", :slider_big => "670x400" }
end
