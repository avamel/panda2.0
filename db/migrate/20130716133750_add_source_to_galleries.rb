class AddSourceToGalleries < ActiveRecord::Migration
  def self.up
    change_table :galleries do |t|
      t.attachment :source
    end
  end

  def self.down
    drop_attached_file :galleries, :source
  end
end
