class AddPkFk2 < ActiveRecord::Migration[7.0]
  def change
    #add_foreign_key :articles, :users, column: :author_id, primary_key: "lng_id"
    add_foreign_key :inventories, :users, column: :user_id, primary_key: "id"
    add_foreign_key :inventories, :users, column: :seller_id, primary_key: "id"
  end
end
