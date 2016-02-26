class Wagon < ActiveRecord::Base
  ECONOM   = "Плацкарт"
  BUSINESS = "Купе"  
  TYPES    = [ECONOM, BUSINESS]
  
  belongs_to :train
end
