class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.integer :user_id
      t.integer :seller_id
      t.float :price
      t.integer :qty

      t.timestamps
    end
  end
end
