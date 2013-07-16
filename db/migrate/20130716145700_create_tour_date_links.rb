class CreateTourDateLinks < ActiveRecord::Migration
  def change
    create_table :tour_date_links do |t|
      t.integer :tour_id
      t.integer :tour_date_id

      t.timestamps
    end
  end
end
