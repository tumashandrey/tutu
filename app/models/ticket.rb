class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :start_railway_station, class_name: 'RailwayStation', foreign_key: 'start_railway_station_id'
  belongs_to :finish_railway_station, class_name: 'RailwayStation', foreign_key: 'finish_railway_station_id'
  
  accepts_nested_attributes_for :user
end
