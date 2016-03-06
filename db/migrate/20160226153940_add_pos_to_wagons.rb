class AddPosToWagons < ActiveRecord::Migration
  def change
    add_column :wagons, :pos, :integer
  end
end
