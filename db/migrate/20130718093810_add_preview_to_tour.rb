class AddPreviewToTour < ActiveRecord::Migration
  def change
    add_column :tours, :preview, :text
  end
end
