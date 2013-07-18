class Travel < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :teaser, :styles => { :thumb => ["210x180#", :jpg] }


  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end
end
