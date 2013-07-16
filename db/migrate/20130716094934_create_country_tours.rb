class CreateCountryTours < ActiveRecord::Migration
  def change
    create_table :country_tours do |t|
      t.integer :country_id
      t.integer :tour_id

      t.timestamps
    end
  end
end
