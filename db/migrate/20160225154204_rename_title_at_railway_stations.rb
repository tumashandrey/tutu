class RenameTitleAtRailwayStations < ActiveRecord::Migration
  def change
    rename_column :railway_stations, :Title, :title
  end
end
