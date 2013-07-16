class AddPriceToTour < ActiveRecord::Migration
  def change
    add_column :tours, :price, :decimal
    add_column :tours, :special_price, :decimal
  end
end
