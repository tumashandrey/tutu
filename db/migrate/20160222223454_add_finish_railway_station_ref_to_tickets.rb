class AddFinishRailwayStationRefToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :finish_railway_station, index: true, foreign_key: true
  end
end
