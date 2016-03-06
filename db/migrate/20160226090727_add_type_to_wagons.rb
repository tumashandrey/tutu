class AddTypeToWagons < ActiveRecord::Migration
  def change
    add_column :wagons, :type, :string
  end
end
