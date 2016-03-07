class SearchesController < ApplicationController  
  def show
    @stations = RailwayStation.all
    
    return if params[:start_station].nil? || params[:end_station].nil?
    
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
    
    @routes = []
    
    Route.all.each do |route|
      start = nil
      finish = nil
      route.railway_stations_routes.order(:station_pos).each do |station_route|
        index = station_route.station_pos
        station_id = station_route.railway_station.id
        start ||= station_route if @start_station.id == station_id  # первая
        finish = station_route if @end_station.id == station_id
      end

      if start && finish and start.station_pos < finish.station_pos
        @routes << route
      end
    end
    
    render 'results'
  end  
end