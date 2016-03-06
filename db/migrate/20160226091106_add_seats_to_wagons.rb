class AddSeatsToWagons < ActiveRecord::Migration
  def change
    add_column :wagons, :side_up_seats, :integer
    add_column :wagons, :side_down_seats, :integer
  end
end
