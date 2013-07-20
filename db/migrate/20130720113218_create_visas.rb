class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.text :overview
      t.string :title

      t.timestamps
    end
  end
end
