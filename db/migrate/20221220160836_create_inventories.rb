class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :user_id
      t.string :seller_id
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
