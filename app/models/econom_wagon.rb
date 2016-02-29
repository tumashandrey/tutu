class EconomWagon < Wagon  
    validates :up_seats, :down_seats, :side_up_seats, :side_down_seats, presence: true
    
    def self.model_name
        Wagon.model_name
    end    
end