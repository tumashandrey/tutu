class Wagon < ActiveRecord::Base
  ECONOM   = "Плацкарт"
  BUSINESS = "Купе"  
  TYPES    = [ECONOM, BUSINESS]
  
  belongs_to :train
  
  after_validation :update_pos, if: :train_id_changed?
  
  private 

  def update_pos
    return unless self.train
    
    max_pos = self.train.wagons.maximum(:pos) || 0
    self.pos = max_pos + 1
  end  
end
