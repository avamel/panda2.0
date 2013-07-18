class AddSlugToTour < ActiveRecord::Migration
  def change
    add_column :tours, :slug, :string
    add_index :tours, :slug, unique: true
  end
end
