class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.string :title
      t.text :preview
      t.text :overview
      t.boolean :published

      t.timestamps
    end
  end
end
