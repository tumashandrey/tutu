class AddTrainRefToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :train, index: true, foreign_key: true
  end
end
