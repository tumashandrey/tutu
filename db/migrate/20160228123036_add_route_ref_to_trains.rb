class AddRouteRefToTrains < ActiveRecord::Migration
  def change
    add_reference :trains, :route, index: true, foreign_key: true
  end
end
