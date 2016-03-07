class AddColumnTimeToRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :arrive_time, :datetime
    add_column :railway_stations_routes, :departure_time, :datetime
  end
end
