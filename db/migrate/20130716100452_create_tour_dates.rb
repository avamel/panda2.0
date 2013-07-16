class CreateTourDates < ActiveRecord::Migration
  def change
    create_table :tour_dates do |t|
      t.date :date

      t.timestamps
    end
  end
end
