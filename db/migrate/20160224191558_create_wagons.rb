class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.references :train, index: true, foreign_key: true
      t.string :type
      t.integer :down_seats
      t.integer :up_seats
    end
  end
end
