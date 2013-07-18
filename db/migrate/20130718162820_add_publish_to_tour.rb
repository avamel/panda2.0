class AddPublishToTour < ActiveRecord::Migration
  def change
    add_column :tours, :publish, :boolean
  end
end
