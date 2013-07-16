class AddTourIdToTourDates < ActiveRecord::Migration
  def change
    add_column :tour_dates, :tour_id, :integer
  end
end
