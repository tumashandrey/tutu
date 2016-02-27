class RailwayStation < ActiveRecord::Base  
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  
  scope :ordered, -> { includes(:railway_stations_routes).order("railway_stations_routes.station_pos ASC") }
  
  def set_position(route, position)
    self.railway_stations_routes.where(route: route).station_pos = position    
  end
end
