class AddExpiresAtToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :expires_at, :datetime
  end
end
