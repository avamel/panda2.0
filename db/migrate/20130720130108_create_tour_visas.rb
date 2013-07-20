class CreateTourVisas < ActiveRecord::Migration
  def change
    create_table :tour_visas do |t|
      t.integer :tour_id
      t.integer :visa_id

      t.timestamps
    end
  end
end
