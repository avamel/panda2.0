class AddIndexToVisa < ActiveRecord::Migration
  def change
  	add_index :visas, :slug
  end
end
