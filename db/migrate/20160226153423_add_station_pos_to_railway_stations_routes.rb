class AddStationPosToRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :station_pos, :integer
  end
end
