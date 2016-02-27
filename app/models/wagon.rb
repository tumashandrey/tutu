class Wagon < ActiveRecord::Base
  ECONOM   = "Плацкарт"
  BUSINESS = "Купе"  
  TYPES    = [ECONOM, BUSINESS]
  
  belongs_to :train
  
  before_save :update_pos, if: :train_id_changed?
  
  private 

  def update_pos
    p "update_pos"
    # self.pos = last_wagon.pos + 1 unless self.id != last_wagon.id
  end  
end
