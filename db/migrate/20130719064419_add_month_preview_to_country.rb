class AddMonthPreviewToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :month_preview, :text
  end
end
