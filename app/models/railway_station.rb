class RailwayStation < ActiveRecord::Base  
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  
  scope :ordered, -> { includes(:railway_stations_routes).order("railway_stations_routes.station_pos ASC") }
  
  def update_position(route, position)
    p self.railway_stations_routes
    station_route = self.railway_stations_routes.where(route: route).first
    station_route.update(station_pos: position) if station_route
  end
  
  def position_in(route)
    station_route = self.railway_stations_routes.where(route: route).first
    station_route.try(:station_pos)
  end
end
