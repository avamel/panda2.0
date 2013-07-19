class CreateTypeOfHolidays < ActiveRecord::Migration
  def change
    create_table :type_of_holidays do |t|
      t.string :title

      t.timestamps
    end
  end
end
