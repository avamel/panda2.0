class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :title
      t.string :slug
      t.text :overview

      t.timestamps
      add_index :countries, :slug, unique: true
    end
  end
end
