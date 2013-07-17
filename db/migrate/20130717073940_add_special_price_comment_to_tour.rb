class AddSpecialPriceCommentToTour < ActiveRecord::Migration
  def change
    add_column :tours, :special_price_comment, :string
  end
end
