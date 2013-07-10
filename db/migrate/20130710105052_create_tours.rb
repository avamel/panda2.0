class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title
      t.string :overview

      t.timestamps
    end
  end
end
