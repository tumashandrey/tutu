class AddFioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fio, :string
  end
end
