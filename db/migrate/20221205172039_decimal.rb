class Decimal < ActiveRecord::Migration[7.0]
  def change
    #change_column(:table_name, :column_name, :date)
    change_column(:inventories, :price, :decimal)
    change_column(:markets, :price, :decimal)
  end
end
