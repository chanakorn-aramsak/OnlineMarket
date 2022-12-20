class CreateMarkets < ActiveRecord::Migration[7.0]
  def change
    create_table :markets do |t|
      t.string :user_id
      t.string :item_id
      t.integer :price
      t.integer :stock

      t.timestamps
    end
  end
end
