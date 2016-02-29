class CoupeWagon < Wagon  
  validates :up_seats, :down_seats, presence: true
  
  def self.model_name
      Wagon.model_name
  end
end