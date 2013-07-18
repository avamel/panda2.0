class AddCurrencyToTour < ActiveRecord::Migration
  def change
    add_column :tours, :currency_id, :integer
  end
end
