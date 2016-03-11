class AddColumnPassportToUsers < ActiveRecord::Migration
  def change
    add_column :users, :passport, :string
  end
end
