class AddColumnInventory < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :item_id, :integer
  end
end
