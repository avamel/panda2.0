class AddMonthCountryToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :month_country, :boolean
  end
end
