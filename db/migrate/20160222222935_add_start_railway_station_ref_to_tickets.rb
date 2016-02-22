class AddStartRailwayStationRefToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :start_railway_station, index: true, foreign_key: true
  end
end
