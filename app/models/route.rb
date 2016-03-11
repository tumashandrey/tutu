class Route < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  
  validates :name, presence: true    
  
  def arrive_departure_time(start_station, finish_station)
    start = self.railway_stations_routes.order(:station_pos).where(railway_station: start_station).first
    finish = self.railway_stations_routes.order(:station_pos).where(railway_station: finish_station).last
    
    "Отправление - #{start.departure_time}, Прибытие - #{finish.arrive_time}"
  end
end
