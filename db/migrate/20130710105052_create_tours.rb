class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title
      t.text :overview
      t.string :teaser_file_name
      t.string :teaser_content_type
      t.integer :teaser_file_size
      t.datetime :teaser_updated_at
      t.timestamps
    end
  end
end
