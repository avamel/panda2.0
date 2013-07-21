class CreateFeedContacts < ActiveRecord::Migration
  def change
    create_table :feed_contacts do |t|
      t.string :contact_type
      t.string :text
      t.references :feed
      t.timestamps
    end
  end
end
