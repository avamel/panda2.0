class RemoveFieldTypeFromGallery < ActiveRecord::Migration
  def change
    remove_column :galleries, :type, :string
  end
end
