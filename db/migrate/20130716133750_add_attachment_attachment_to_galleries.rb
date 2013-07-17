class AddAttachmentAttachmentToGalleries < ActiveRecord::Migration
  def self.up
    change_table :galleries do |t|
      t.attachment :attachment
    end
  end

  def self.down
    drop_attached_file :galleries, :attachment
  end
end
