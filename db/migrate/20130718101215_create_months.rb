class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.text :preview
      t.boolean :activate
      t.integer :country_id

      t.timestamps
    end
  end
end
