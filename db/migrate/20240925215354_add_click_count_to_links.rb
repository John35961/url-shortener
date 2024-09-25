class AddClickCountToLinks < ActiveRecord::Migration[6.1]
  def change
    add_column :links, :click_count, :integer, default: 0, null: false
  end
end
