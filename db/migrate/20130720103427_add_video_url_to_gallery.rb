class AddVideoUrlToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :video_url, :string
  end
end
