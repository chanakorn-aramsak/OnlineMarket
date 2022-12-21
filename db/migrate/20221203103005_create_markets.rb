class CreateMarkets < ActiveRecord::Migration[7.0]
  def change
    create_table :markets do |t|
      t.integer :user_id
      t.integer :item_id
      t.float :price
      t.integer :stock

      t.timestamps
    end
  end
end
