class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :content
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
