class AddTeaserToMonth < ActiveRecord::Migration
  def self.up
    add_column :months, :teaser_file_name,    :string
    add_column :months, :teaser_content_type, :string
    add_column :months, :teaser_file_size,    :integer
    add_column :months, :teaser_updated_at,   :datetime
  end

  def self.down
    remove_column :months, :teaser_file_name
    remove_column :months, :teaser_content_type
    remove_column :months, :teaser_file_size
    remove_column :months, :teaser_updated_at
  end
end
