class Travel < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :published, where("travels.published IS TRUE")
  scope :unpublished, where("travels.published IS NOT TRUE")

  has_attached_file :teaser, :styles => { :thumb => ["210x180#", :jpg] }


  validates :title, presence: true
  validates :preview, presence: true
  validates :overview, presence: true


  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end
end
