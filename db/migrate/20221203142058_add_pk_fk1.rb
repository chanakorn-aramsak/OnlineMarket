class AddPkFk1 < ActiveRecord::Migration[7.0]
  def change
    # add_foreign_key :articles, :users, column: :author_id, primary_key: "lng_id"
    # add_foreign_key :inventories, :users, column: :user_id, primary_key: "email"
    add_index :users, :email, unique: true
  end
end
