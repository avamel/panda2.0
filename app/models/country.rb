class Country < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :country_tours
  has_many :tours, :through => :country_tours

  scope :europe, -> { where(:region => "Europe") }
  scope :africa, -> { where(:region => "Africa") }
  scope :south_america, -> { where(:region => "South_america") }
  scope :asia, -> { where(:region => "Asia") }
  scope :also, -> { where(:region => "Also") }

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  validates :region, presence: true

  has_attached_file :teaser, :styles => { :masonry_little => ["208x180#", :jpg], :masonry_big => ["450x396#", :jpg] }
  has_destroyable_file :teaser

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end
end
