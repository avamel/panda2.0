class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.text :overview
      t.integer :tour_id

      t.timestamps
    end
  end
end
