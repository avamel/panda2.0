class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :source_file_name
      t.string :source_content_type
      t.integer :source_file_size
      t.datetime :source_updated_at
      t.references :tour

      t.timestamps
    end
    add_index :galleries, :tour_id
  end
end