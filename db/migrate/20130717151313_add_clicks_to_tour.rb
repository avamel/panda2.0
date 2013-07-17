class AddClicksToTour < ActiveRecord::Migration
  def change
    add_column :tours, :clicks, :integer
  end
end
