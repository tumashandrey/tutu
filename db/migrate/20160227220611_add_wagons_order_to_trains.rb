class AddWagonsOrderToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :wagons_order_asc, :boolean
  end
end
