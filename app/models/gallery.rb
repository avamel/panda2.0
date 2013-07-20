class Gallery < ActiveRecord::Base
  belongs_to :tour

  validate :type_validation

  has_attached_file :source, :styles => { :thumb => ["128x128>", :jpg], :medium => ["670x340#", :jpg],
  	                                      :slider_thumb => "104x52#", :index_thumb  => "70x60>", :slider_big => "670x400" }

  private

  def type_validation
    if self.attachment_type == "видео"
      errors.add(:text, "нельзя прикреплять изображение к типу видео") unless self.source.blank?
    else
      errors.add(:text, "нельзя прикреплять видео к типу изображения") unless self.video_url.blank?
    end
  end
end
