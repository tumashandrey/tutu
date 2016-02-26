class AddSeatPlaceToWagons < ActiveRecord::Migration
  def change
    add_column :wagons, :seat_places, :integer
  end
end
