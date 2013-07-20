class AddAttachmentTypeToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :attachment_type, :string
  end
end
