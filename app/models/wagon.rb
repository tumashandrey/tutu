class Wagon < ActiveRecord::Base
  ECONOM   = "Плацкарт"
  BUSINESS = "Купе"  
  TYPES    = [ECONOM, BUSINESS]
  
  belongs_to :train
  
  validates :pos, uniqueness: { scope: :train_id }
  
  after_validation :update_pos, if: :train_id_changed?
  
  scope :order_asc, -> { order('pos ASC') }
  scope :order_desc, -> { order('pos DESC') }
  
  private 

  def update_pos
    return unless self.train
    
    max_pos = self.train.wagons.maximum(:pos) || 0
    self.pos = max_pos + 1
  end
end
