class Feed < ActiveRecord::Base
  has_many :feed_contacts, :dependent => :destroy

  accepts_nested_attributes_for :feed_contacts, :allow_destroy => true
end
