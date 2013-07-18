class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.references :tour

      t.timestamps
    end
    add_index :galleries, :tour_id
  end
end