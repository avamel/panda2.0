class AddClicksToTour < ActiveRecord::Migration
  def change
    add_column :tours, :clicks, :integer, :default => 0
  end
end
