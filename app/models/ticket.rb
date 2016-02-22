class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :start_railway_station, class_name: 'RailwayStation'
  belongs_to :finish_railway_station, class_name: 'RailwayStation'
end
