class SearchesController < ApplicationController  
  def show
    @stations = RailwayStation.all
    
    return if params[:start_station].nil? || params[:end_station].nil?
    
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
    
    @routes = []
    
    start_routes = Route.joins(:railway_stations_routes).where(railway_stations_routes: {railway_station_id: @start_station})
    end_routes = Route.joins(:railway_stations_routes).where(railway_stations_routes: {railway_station_id: @end_station})
    
    @routes = start_routes & end_routes
    
    render 'results'
  end  
end