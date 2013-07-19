class News < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_attached_file :teaser, :styles => { :masonry_little => ["208x180#", :jpg], :masonry_big => ["450x396#", :jpg] }
end
