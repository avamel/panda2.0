class AddSlugToVisa < ActiveRecord::Migration
  def change
    add_column :visas, :slug, :string
  end
end
