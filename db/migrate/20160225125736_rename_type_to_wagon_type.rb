class RenameTypeToWagonType < ActiveRecord::Migration
  def change
    rename_column :wagons, :type, :wagon_type
  end
end
