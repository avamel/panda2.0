class CreateTypeOfTours < ActiveRecord::Migration
  def change
    create_table :type_of_tours do |t|
      t.references :type_of_holiday
      t.references :tour

      t.timestamps
    end
    add_index :type_of_tours, :type_of_holiday_id
    add_index :type_of_tours, :tour_id
  end
end
