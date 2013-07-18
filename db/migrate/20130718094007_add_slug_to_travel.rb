class AddSlugToTravel < ActiveRecord::Migration
  def change
    add_column :travels, :slug, :string
  end
end
