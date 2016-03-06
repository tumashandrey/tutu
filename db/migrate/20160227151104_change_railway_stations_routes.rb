class ChangeRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :id, :primary_key
  end
end
