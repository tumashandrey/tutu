class RailwayStation < ActiveRecord::Base  
    has_and_belongs_to_many :routes
end
