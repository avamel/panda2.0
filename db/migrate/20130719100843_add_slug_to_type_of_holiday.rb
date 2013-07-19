class AddSlugToTypeOfHoliday < ActiveRecord::Migration
  def change
    add_column :type_of_holidays, :slug, :string
  end
end
