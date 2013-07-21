class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :title
      t.string :phone
      t.string :email
      t.string :notation
      t.integer :tour_id

      t.timestamps
    end
  end
end
