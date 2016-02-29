class Wagon < ActiveRecord::Base
  ECONOM   = "Плацкарт"
  BUSINESS = "Купе"  
  SV       = "СВ"
  SEAT     = "Сидячий"  

  TYPES_HASH    = { ECONOM  => EconomWagon.to_s, 
                    BUSINESS => CoupeWagon.to_s,
                    SV => SvWagon.to_s,
                    SEAT => SeatWagon.to_s
                   }
               
  belongs_to :train
  
  validates :pos, uniqueness: { scope: :train_id }, if: :train_id
  validates :train, presence: true
  
  after_validation :update_pos, if: :train_id_changed?
  before_create :update_wagon_type
  
  scope :order_asc, -> { order('pos ASC') }
  scope :order_desc, -> { order('pos DESC') }
  
  private 

  def update_pos
    return unless self.train
    
    max_pos = self.train.wagons.maximum(:pos) || 0
    self.pos = max_pos + 1
  end
  
  def update_wagon_type
    self.wagon_type = TYPES_HASH.key(self.type)
  end  
end
