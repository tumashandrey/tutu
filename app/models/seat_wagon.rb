class SeatWagon < Wagon
  validates :seat_places, presence: true
  
  def self.model_name
      Wagon.model_name
  end  
end