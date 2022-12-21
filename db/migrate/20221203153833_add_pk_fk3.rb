class AddPkFk3 < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :markets, :users, column: :user_id, primary_key: "id"
    add_foreign_key :markets, :items, column: :item_id, primary_key: "id"
  end
end
